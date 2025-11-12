#!/usr/bin/env python3
# nl_command_bridge_action.py  (script-of-API-calls variant)

import os
import re
import threading
from collections import deque
from typing import Deque

import requests
import rclpy
from rclpy.node import Node
from rclpy.action import ActionClient
from std_msgs.msg import String
from geometry_msgs.msg import Pose
from gazebo_msgs.srv import SpawnEntity

from panda_task_msgs.action import ManipTask


# ---------- LLM prompt (direct calls) ----------

CODE_SCRIPT_PROMPT = """
You are a robotics controller that outputs a Python script.
Given a user's natural language instruction, output ONE fenced Python code block
that directly calls the provided API functions below to perform the task.
Do not define new functions. Do not import anything. Do not perform IO/network.

REMEMBER
- You are controling an arm, therefore consider that if the user asks something, it should be made with the arm.
- Commands like "Spawn and move the box" means you should use the API to pick and place the box after spawning it, not just doing to command "go_to_position()".
- Learn to understand the context and create the code considering you are controling the arm, and will always be ask to do something with the arm.
- Spawning the box is just a placeholder so you know its coordinates, in the real world would have a vision model to get the coordinates, therefore spawning the box is just to simulate that you know where the box is.
- Therefore, if the user asks "Move a box" you should spawn a box first, even if is not explicitly said in the user instruction.
- You may pause between actions using wait(seconds); prefer short waits (< 5 s).

AVAILABLE API (already defined in your execution environment):
- home() -> None
- open_gripper() -> None
- close_gripper() -> None
- go_to_position(x, y, z, r=0.0, p=90.0, yaw_deg=0.0) -> None
- pick_object(x, y, z, size=None) -> None
- place_object(x, y, z, size=None) -> None
- spawn_box(x, y, z, size=None) -> None
- default_box_size() -> float
- home_rpy_deg() -> (r, p, yaw)
- wait(seconds: float) -> None

CONSTRAINTS:
- Output ONLY a single fenced Python block; no text before/after.
- Use meters for x,y,z and size; degrees for r,p,yaw_deg.
- Keep z ≥ 0.000. Frame origin is "panda_link0". Worktable plane is z = 0.
- Deterministic behavior for identical inputs.
- If the plan includes arm motion, call home() exactly once at the beginning.
- Use minimal sequences respecting the pick/place procedures described below.
- You may use variables, arithmetic, for-loops, and comments.
- Do NOT import modules or use eval/exec, files, env, or network.
- Do NOT use names containing double underscores.

DEFAULTS:
- If location missing: x=0.550, y=0.000, z=0.000.
- Default box size is default_box_size().
- If count omitted, assume 1.
- Parse simple textual counts (one..ten) if present in the user instruction.
- Convert centimeters to meters if the user specifies cm.

GRASP/PLACE SEMANTICS (when you need to pick/place free boxes):
Let s be the box size (default if None):
  hover_z = max(z + 0.6*s, z + 0.150)
  grasp_z = z + max(0.5*s, 0.030)
  place_z = z + max(0.5*s, 0.030)
To pick at (x,y,z):
  go_to_position(x,y,hover_z); open_gripper(); go_to_position(x,y,grasp_z); close_gripper(); go_to_position(x,y,hover_z)
To place at (x,y,z):
  go_to_position(x,y,hover_z); go_to_position(x,y,place_z); open_gripper(); go_to_position(x,y,hover_z)

PLANNING RULES:
- For multiple objects, order left-to-right then front-to-back.
- Keep outputs numerically stable; use regular decimals (no scientific notation).

EXAMPLES (format only):

# Example 1: "Create a tower with 3 boxes."
home()
s = 0.050
spawn_box(0.550, -0.200, 0.000, size=s)
spawn_box(0.610, -0.200, 0.000, size=s)
spawn_box(0.670, -0.200, 0.000, size=s)
# Build at (0.400, 0.000)
pick_object(0.550, -0.200, 0.000, size=s)
wait(1.0)
place_object(0.400, 0.000, 0.000, size=s)
wait(2.0)
pick_object(0.610, -0.200, 0.000, size=s)
wait(1.0)
place_object(0.400, 0.000, s,     size=s)
wait(2.0)
pick_object(0.670, -0.200, 0.000, size=s)
wait(1.0)
place_object(0.400, 0.000, 2*s,   size=s)

# Example 2: "Spawn five large boxes in a row at x=0.3 y=0.4."
s = 0.070
x0, y0 = 0.300, 0.400
for i in range(5):
    spawn_box(x0 + i*s, y0, 0.000, size=s)

# Example 3: "Move above the stack and open the gripper."
home()
go_to_position(0.400, 0.000, 0.250)
wait(0.5)
open_gripper()
"""


PROXY = os.environ.get("OPENAI_PROXY_URL", "http://127.0.0.1:8000")


def ask_via_proxy(prompt: str, system: str) -> str:
    payload = {
        "model": "gpt-4o-mini",
        "messages": [
            {"role": "system", "content": system},
            {"role": "user", "content": prompt}
        ],
        "temperature": 0.2
    }
    r = requests.post(f"{PROXY}/chat", json=payload, timeout=(3, 15))
    r.raise_for_status()
    data = r.json()
    return data.get("text") or data["choices"][0]["message"]["content"]


# ---------- Code extraction & guard ----------

_PY_BLOCK = re.compile(r"```(?:python)?\s*(.*?)\s*```", re.DOTALL | re.IGNORECASE)
_FORBIDDEN_PATTERNS = [
    r"\bimport\b", r"\bopen\s*\(", r"\beval\s*\(", r"\bexec\s*\(",
    r"__\w+__", r"\bos\b", r"\bsys\b", r"\bsubprocess\b",
    r"\bsocket\b", r"\burllib\b", r"\brequests\b"
]
_forbidden_re = re.compile("|".join(_FORBIDDEN_PATTERNS))


def extract_python(s: str) -> str:
    m = _PY_BLOCK.search(s)
    return m.group(1) if m else s.strip()


def is_safe(code: str) -> bool:
    return not _forbidden_re.search(code)


# ---------- ROS Node ----------

class NLCommandBridge(Node):
    def __init__(self):
        super().__init__("nl_command_bridge")

        # Params
        self.declare_parameter("status_topic", "/manip_task/status")
        self.declare_parameter("spawn_reference_frame", "world")
        self.declare_parameter("default_box_size", 0.05)
        self.declare_parameter("action_name", "manip_task")

        self.status_topic = self.get_parameter("status_topic").value
        self.spawn_ref = self.get_parameter("spawn_reference_frame").value
        self._default_box = float(self.get_parameter("default_box_size").value)
        self.action_name = self.get_parameter("action_name").value

        # IO
        self._sub_nl = self.create_subscription(String, "/nl_command", self._on_nl, 10)
        self._pub_status = self.create_publisher(String, self.status_topic, 10)

        # Gazebo spawn service
        self._spawn_cli = self.create_client(SpawnEntity, "/spawn_entity")

        # Action client
        self._ac = ActionClient(self, ManipTask, self.action_name)

        # Work queue
        self._inbox: Deque[str] = deque()
        self._inbox_evt = threading.Event()
        self._lock = threading.Lock()
        self._worker_thread = threading.Thread(target=self._worker, daemon=True)
        self._worker_thread.start()

        self.get_logger().info("NLCommandBridge (direct-call script) ready")

    # ---------- ROS callbacks ----------

    def _on_nl(self, msg: String):
        text = msg.data.strip()
        if not text:
            return
        self._status(f"rx:'{text}'")
        with self._lock:
            self._inbox.append(text)
        self._inbox_evt.set()

    # ---------- Worker ----------

    def _worker(self):
        while rclpy.ok():
            if self._ac.wait_for_server(timeout_sec=0.5):
                break
            self._status("waiting for action server...")
        while rclpy.ok():
            self._inbox_evt.wait(timeout=0.1)
            text = None
            with self._lock:
                if self._inbox:
                    text = self._inbox.popleft()
                if not self._inbox:
                    self._inbox_evt.clear()
            if text is None:
                continue
            try:
                self._generate_and_run_script(text)
            except Exception as e:
                self._status(f"script error: {e}")

    # ---------- LLM script generation & execution ----------

    def _generate_and_run_script(self, user_text: str):
        raw = ask_via_proxy(prompt=f"User request: {user_text}", system=CODE_SCRIPT_PROMPT)
        code = extract_python(raw)
        if not is_safe(code):
            raise RuntimeError("Rejected unsafe code")

        # Bind API exposed to the LLM script
        def _home():
            self._send_action("HOME")

        def _open():
            self._send_action("OPEN")

        def _close():
            self._send_action("CLOSE")

        def _go(x, y, z, r=0.0, p=90.0, yaw_deg=0.0):
            cmd = f"GO {float(x):.3f} {float(y):.3f} {float(z):.3f} {float(r):.3f} {float(p):.3f} {float(yaw_deg):.3f}"
            self._send_action(cmd)

        def _pick(x, y, z, size=None):
            s = float(self._default_box if size is None else size)
            cmd = f"PICK {float(x):.3f} {float(y):.3f} {float(z):.3f} {s:.3f}"
            self._send_action(cmd)

        def _place(x, y, z, size=None):
            s = float(self._default_box if size is None else size)
            cmd = f"PLACE {float(x):.3f} {float(y):.3f} {float(z):.3f} {s:.3f}"
            self._send_action(cmd)

        def _spawn(x, y, z, size=None):
            s = float(self._default_box if size is None else size)
            ok = self._spawn_box_async(float(x), float(y), float(z), s)
            self._status(f"spawn_box({float(x):.3f},{float(y):.3f},{float(z):.3f},{s:.3f}) -> {'ok' if ok else 'fail'}")

        def _wait(seconds):
            # Clamp and validate
            try:
                secs = float(seconds)
            except Exception:
                secs = 0.0
            if secs <= 0.0:
                return
            if hasattr(self, "_max_wait_seconds"):
                secs = min(secs, self._max_wait_seconds)

            # Sleep in short slices so we remain responsive to shutdown
            slice_len = 0.05
            remaining = secs
            while remaining > 0.0 and rclpy.ok():
                time.sleep(min(slice_len, remaining))
                remaining -= slice_len

        def _default_box_size() -> float:
            return float(self._default_box)

        def _home_rpy_deg():
            return (0.0, 90.0, 0.0)

        safe_builtins = {
            "range": range,
            "len": len,
            "min": min,
            "max": max,
            "abs": abs,
            "round": round,
            "enumerate": enumerate,
            "float": float,
            "int": int
        }
        g = {
            "__builtins__": safe_builtins,
            # API exposed to the generated script
            "home": _home,
            "open_gripper": _open,
            "close_gripper": _close,
            "go_to_position": _go,
            "pick_object": _pick,
            "place_object": _place,
            "spawn_box": _spawn,
            "default_box_size": _default_box_size,
            "home_rpy_deg": _home_rpy_deg,
            "wait": _wait
        }
        l = {}

        self._status("exec script...")
        exec(code, g, l)  # guarded by is_safe + restricted builtins

    # ---------- Action + spawn helpers ----------

    def _send_action(self, cmd_str: str):
        goal = ManipTask.Goal()
        goal.command = cmd_str
        done_evt = threading.Event()
        gh_container = {}

        def _on_goal_done(fut):
            gh_container["gh"] = fut.result()
            done_evt.set()

        fb_cb = lambda fb: self._status(f"feedback: {fb.feedback.status}")

        self._status(f"cmd:{cmd_str}")
        future_gh = self._ac.send_goal_async(goal, feedback_callback=fb_cb)
        future_gh.add_done_callback(_on_goal_done)
        while not done_evt.wait(timeout=0.05) and rclpy.ok():
            pass
        if not rclpy.ok():
            return
        gh = gh_container.get("gh")
        if gh is None or not gh.accepted:
            self._status(f"goal rejected: {cmd_str}")
            return

        res_evt = threading.Event()
        res_container = {}

        def _on_res_done(fut):
            res_container["res"] = fut.result()
            res_evt.set()

        future_res = gh.get_result_async()
        future_res.add_done_callback(_on_res_done)
        while not res_evt.wait(timeout=0.05) and rclpy.ok():
            pass
        if not rclpy.ok():
            return
        res = res_container.get("res")
        if res is None:
            self._status("result missing")
            return
        self._status(f"result: {res.result.result}")

    def _spawn_box_async(self, x: float, y: float, z: float, size: float) -> bool:
        name = self._stable_box_name(x, y, z, size)
        xml = self._sdf_box(name, size=size)
        pose = Pose()
        pose.position.x = x
        pose.position.y = y
        pose.position.z = z + size / 2.0
        pose.orientation.w = 1.0

        if not self._spawn_cli.service_is_ready():
            if not self._spawn_cli.wait_for_service(timeout_sec=5.0):
                self._status("spawn service not available")
                return False

        req = SpawnEntity.Request()
        req.name = name
        req.xml = xml
        req.initial_pose = pose
        req.reference_frame = self.spawn_ref

        future = self._spawn_cli.call_async(req)

        done_evt = threading.Event()
        container = {}

        def _on_done(fut):
            container["resp"] = fut.result() if not fut.cancelled() else None
            container["exc"] = fut.exception()
            done_evt.set()

        future.add_done_callback(_on_done)
        while not done_evt.wait(timeout=0.05) and rclpy.ok():
            pass
        if not rclpy.ok():
            return False

        if container.get("exc") is not None:
            self.get_logger().error(f"spawn exception: {container['exc']}")
            return False

        resp = container.get("resp")
        if resp is None:
            self.get_logger().error("spawn timeout or cancelled")
            return False

        ok = getattr(resp, "success", True)
        if not ok:
            self.get_logger().error(f"spawn failed: {getattr(resp,'status_message','')}")
        return bool(ok)

    @staticmethod
    def _stable_box_name(x: float, y: float, z: float, size: float) -> str:
        import hashlib as _hashlib
        m = _hashlib.sha1(f"{x:.6f},{y:.6f},{z:.6f},{size:.6f}".encode())
        return f"box_{m.hexdigest()[:8]}"

    @staticmethod
    def _sdf_box(name: str, size: float, mass: float = 0.05) -> str:
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
