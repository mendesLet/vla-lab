#!/usr/bin/env python3
import os
import re
import json
import math
import hashlib
import requests
from typing import List, Optional

import rclpy
from rclpy.node import Node
from std_msgs.msg import String
from geometry_msgs.msg import Pose
from gazebo_msgs.srv import SpawnEntity

# ---------- LLM schema ----------

COMMAND_SCHEMA = {
    "type": "object",
    "properties": {
        "commands": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "op": {
                        "type": "string",
                        "enum": ["HOME", "OPEN", "CLOSE", "GO", "PICK", "PLACE", "SPAWN_BOX"]
                    },
                    "x": {"type": "number"},
                    "y": {"type": "number"},
                    "z": {"type": "number"},
                    "r": {"type": "number"},
                    "p": {"type": "number"},
                    "yaw_deg": {"type": "number"},
                    "size": {"type": "number"}
                },
                "required": ["op"]
            }
        }
    },
    "required": ["commands"]
}

SYSTEM_PROMPT = """You are a robotics command planner.

Output only a single JSON object matching this JSON Schema:
<schema>
{json_schema}
</schema>

Rules:
- Use only these ops: HOME, OPEN, CLOSE, GO, PICK, PLACE, SPAWN_BOX.
- GO needs x,y,z; optional r,p,yaw_deg.
- PICK/PLACE need x,y,z; optional size default 0.05.
- SPAWN_BOX needs x,y,z; optional size default 0.05.
- Worktable plane z=0 in the robot base/world.
- If location is missing, choose defaults:
  - pick: x=0.55, y=0.00, z=0.00
  - place: x=0.30, y=0.50, z=0.00
- Always OPEN before PICK.
- Always start with HOME.
- For PICK: GO to a hover pose (same x,y with z+0.25), then PICK at target.
- For PLACE: GO to a hover pose (same x,y with z+0.25), then PLACE at target, then OPEN.
- No prose. No code fences. Output only the JSON object.
""".replace("{json_schema}", json.dumps(COMMAND_SCHEMA))

PROXY = os.environ.get("OPENAI_PROXY_URL", "http://127.0.0.1:8000")

def ask_via_proxy(prompt: str, system: str) -> str:
    # visible on stdout for quick triage
    print("LLM proxy:", PROXY)
    print("LLM prompt:", prompt[:200])

    payload = {
        "model": "gpt-4o-mini",
        "messages": [
            {"role": "system", "content": system},
            {"role": "user", "content": prompt}
        ],
        "temperature": 0.2
    }
    try:
        # (connect_timeout, read_timeout)
        r = requests.post(f"{PROXY}/chat", json=payload, timeout=(3, 15))
        r.raise_for_status()
        # guard JSON decode
        try:
            data = r.json()
        except ValueError:
            raise RuntimeError(f"Non-JSON response: {r.text[:200]}")
        print("LLM response:", data)
        return data.get("text") or data["choices"][0]["message"]["content"]
    except Exception as e:
        # log to ROS status if possible
        if rclpy.ok():
            # avoid using internal utilities; just print to node if running
            try:
                node = rclpy.get_global_executor().get_nodes()[0]  # best-effort
                node.get_logger().error(f"LLM HTTP error: {e}")
            except Exception:
                pass
        raise


_JSON_BLOCK_RE = re.compile(r"```(?:json)?\s*(\{.*?\})\s*```", re.DOTALL)
_FIRST_OBJ_RE = re.compile(r"(\{.*\})", re.DOTALL)


def extract_json(s: str) -> str:
    """Extract a JSON object from model text. Prefer fenced, else first {...}."""
    m = _JSON_BLOCK_RE.search(s)
    if m:
        return m.group(1)
    m = _FIRST_OBJ_RE.search(s)
    if m:
        return m.group(1)
    raise ValueError("No JSON object found in model output")


def validate_schema(obj: dict) -> None:
    """Validate against COMMAND_SCHEMA without external deps."""
    if not isinstance(obj, dict) or "commands" not in obj or not isinstance(obj["commands"], list):
        raise ValueError("Invalid root, missing 'commands'")
    for i, c in enumerate(obj["commands"]):
        if not isinstance(c, dict):
            raise ValueError(f"Command {i} is not an object")
        op = c.get("op")
        if op not in {"HOME", "OPEN", "CLOSE", "GO", "PICK", "PLACE", "SPAWN_BOX"}:
            raise ValueError(f"Command {i} invalid op: {op}")
        # Field types if present
        for k in ("x", "y", "z", "r", "p", "yaw_deg", "size"):
            if k in c and c[k] is not None and not isinstance(c[k], (int, float, str)):
                raise ValueError(f"Command {i} field {k} has invalid type")


def coerce_numeric_fields(cmds: List[dict]) -> None:
    """Cast any numeric-like strings to float in-place."""
    for c in cmds:
        for k in ("x", "y", "z", "r", "p", "yaw_deg", "size"):
            if k in c and c[k] is not None:
                try:
                    c[k] = float(c[k])
                except (TypeError, ValueError):
                    pass


# ---------- ROS Node ----------

class NLCommandBridge(Node):
    def __init__(self):
        super().__init__("nl_command_bridge")

        # Params
        self.declare_parameter("cmd_topic", "/manip_task/cmd")
        self.declare_parameter("status_topic", "/manip_task/status")
        self.declare_parameter("spawn_reference_frame", "world")
        self.declare_parameter("default_box_size", 0.05)

        self.cmd_topic = self.get_parameter("cmd_topic").value
        self.status_topic = self.get_parameter("status_topic").value
        self.spawn_ref = self.get_parameter("spawn_reference_frame").value
        self.default_box = float(self.get_parameter("default_box_size").value)

        # IO
        self._pub_cmd = self.create_publisher(String, self.cmd_topic, 10)
        self._sub_nl = self.create_subscription(String, "/nl_command", self._on_nl, 10)
        self._pub_status = self.create_publisher(String, self.status_topic, 10)

        # Gazebo spawn service for SPAWN_BOX
        self._spawn_cli = self.create_client(SpawnEntity, "/spawn_entity")

        self.get_logger().info("NLCommandBridge ready")

    # ---------- ROS callbacks ----------

    def _on_nl(self, msg: String):
        text = msg.data.strip()
        if not text:
            return
        self._status(f"rx:'{text}'")
        try:
            plan = self._plan_commands(text)
        except Exception as e:
            self._status(f"LLM parse error: {e}")
            return

        for step in plan:
            try:
                op = step.get("op")
                if op == "SPAWN_BOX":
                    x = float(step.get("x", 0.55))
                    y = float(step.get("y", 0.0))
                    z = float(step.get("z", 0.0))
                    size = float(step.get("size", self.default_box))
                    ok = self._spawn_box(x, y, z, size)
                    self._status(f"spawn_box({x:.3f},{y:.3f},{z:.3f},{size:.3f}) -> {'ok' if ok else 'fail'}")
                else:
                    cmd_str = self._cmd_string(step)
                    if cmd_str:
                        self._pub_cmd.publish(String(data=cmd_str))
                        self._status(f"cmd:{cmd_str}")
                    else:
                        self._status(f"skipped invalid step: {step}")
            except Exception as e:
                self._status(f"step error: {e}")

    # ---------- LLM planning ----------

    def _plan_commands(self, user_text: str) -> List[dict]:
        """
        Query LLM with strict instructions. Parse, validate, coerce.
        """
        raw = ask_via_proxy(prompt=f"User request: {user_text}", system=SYSTEM_PROMPT)
        content = extract_json(raw)
        data = json.loads(content)
        validate_schema(data)
        cmds = data["commands"]
        coerce_numeric_fields(cmds)
        return cmds

    # ---------- Gazebo spawn ----------

    def _spawn_box(self, x: float, y: float, z: float, size: float) -> bool:
        """
        Spawn a cubic SDF model at (x, y, z + size/2). Returns True on Gazebo success.
        """
        name = self._stable_box_name(x, y, z, size)
        xml = self._sdf_box(name, size=size)
        pose = Pose()
        pose.position.x = x
        pose.position.y = y
        pose.position.z = z + size / 2.0
        pose.orientation.w = 1.0

        # wait for service if needed
        if not self._spawn_cli.service_is_ready():
            ok = self._spawn_cli.wait_for_service(timeout_sec=5.0)
            if not ok:
                self._status("spawn service not available")
                return False

        req = SpawnEntity.Request()
        req.name = name
        req.xml = xml
        req.initial_pose = pose
        req.reference_frame = self.spawn_ref

        future = self._spawn_cli.call_async(req)
        rclpy.spin_until_future_complete(self, future, timeout_sec=10.0)

        if not future.done():
            self.get_logger().error("spawn timeout")
            return False
        if future.exception() is not None:
            self.get_logger().error(f"spawn exception: {future.exception()}")
            return False

        resp = future.result()
        # Gazebo classic exposes 'success' and 'status_message'
        ok = getattr(resp, "success", True)
        msg = getattr(resp, "status_message", "")
        if not ok:
            self.get_logger().error(f"spawn failed: {msg}")
        return bool(ok)

    @staticmethod
    def _stable_box_name(x: float, y: float, z: float, size: float) -> str:
        m = hashlib.sha1(f"{x:.6f},{y:.6f},{z:.6f},{size:.6f}".encode())
        return f"box_{m.hexdigest()[:8]}"

    @staticmethod
    def _sdf_box(name: str, size: float, mass: float = 0.05) -> str:
        # Simple solid cube inertia: I = (1/6) m a^2
        i = (1.0 / 6.0) * mass * (size ** 2)
        return f"""<?xml version='1.0'?>
<sdf version='1.6'>
  <model name='{name}'>
    <static>false</static>
    <link name='link'>
      <pose>0 0 0 0 0 0</pose>
      <inertial>
        <mass>{mass}</mass>
        <inertia>
          <ixx>{i}</ixx><iyy>{i}</iyy><izz>{i}</izz>
          <ixy>0</ixy><ixz>0</ixz><iyz>0</iyz>
        </inertia>
      </inertial>
      <collision name='col'>
        <geometry><box><size>{size} {size} {size}</size></box></geometry>
        <surface>
          <contact>
            <ode><kp>5e5</kp><kd>50</kd><max_vel>0.1</max_vel><min_depth>0.001</min_depth></ode>
          </contact>
          <friction>
            <ode><mu>1.2</mu><mu2>1.2</mu2><slip1>0.0</slip1><slip2>0.0</slip2></ode>
          </friction>
        </surface>
      </collision>
      <visual name='vis'>
        <geometry><box><size>{size} {size} {size}</size></box></geometry>
      </visual>
    </link>
  </model>
</sdf>"""

    # ---------- Helpers ----------

    def _cmd_string(self, step: dict) -> Optional[str]:
        """
        Serialize a step for the downstream task library.
        Units: r, p, yaw_deg are treated as degrees here to match the original interface.
        Adjust if your planner expects radians.
        """
        op = step.get("op")
        if op in ("HOME", "OPEN", "CLOSE"):
            return op

        if op == "GO":
            x = step.get("x"); y = step.get("y"); z = step.get("z")
            if None in (x, y, z):
                return None
            r = float(step.get("r", 0.0))
            p = float(step.get("p", 90.0))  # keep 90° default to match original
            yaw = float(step.get("yaw_deg", 0.0))
            return f"GO {x:.3f} {y:.3f} {z:.3f} {r:.3f} {p:.3f} {yaw:.3f}"

        if op == "PICK":
            x = step.get("x"); y = step.get("y"); z = step.get("z")
            if None in (x, y, z):
                return None
            size = float(step.get("size", self.default_box))
            return f"PICK {x:.3f} {y:.3f} {z:.3f} {size:.3f}"

        if op == "PLACE":
            x = step.get("x"); y = step.get("y"); z = step.get("z")
            if None in (x, y, z):
                return None
            size = float(step.get("size", self.default_box))
            return f"PLACE {x:.3f} {y:.3f} {z:.3f} {size:.3f}"

        return None

    def _status(self, s: str):
        self._pub_status.publish(String(data=f"nl_bridge: {s}"))


# ---------- Main ----------

def main(args=None):
    rclpy.init(args=args)
    node = NLCommandBridge()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == "__main__":
    main()
