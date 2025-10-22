from __future__ import annotations
import json
from typing import Any, Dict

import rclpy
from rclpy.node import Node

from panda_env_cmd.env_api import EnvAPI, build_fixed_vars
from panda_env_cmd_interfaces.srv import ExecCommand # generated from srv/ExecCommand.srv


class CommandServer(Node):
    def __init__(self) -> None:
        super().__init__("env_command_server")

        # Build the environment and function registry
        self._env = EnvAPI()
        self._registry: Dict[str, Any] = build_fixed_vars(self._env)

        # Advertise service
        self._srv = self.create_service(
            ExecCommand, "~exec", self._on_exec
        )
        self.get_logger().info(
            f"Command server ready with {len(self._registry)} commands: {sorted(self._registry.keys())}"
        )

    def _on_exec(self, request: ExecCommand.Request, response: ExecCommand.Response):
        name = request.command
        try:
            kwargs = json.loads(request.json_args) if request.json_args else {}
        except Exception as e:
            response.success = False
            response.json_result = ""
            response.error = f"Invalid JSON args: {e}"
            return response

        fn = self._registry.get(name)
        if fn is None:
            response.success = False
            response.json_result = ""
            response.error = f"Unknown command '{name}'. Available: {sorted(self._registry.keys())}"
            return response

        try:
            # Call with keyword args only; adjust if you prefer *args
            res = fn(**kwargs) if callable(fn) else fn
            response.success = True
            response.json_result = json.dumps(res)
            response.error = ""
        except Exception as e:
            response.success = False
            response.json_result = ""
            response.error = f"Exception during '{name}': {e}"
        return response

def main(args=None) -> None:
    rclpy.init(args=args)
    node = CommandServer()
    try:
        rclpy.spin(node)
    finally:
        node.destroy_node()
        rclpy.shutdown()