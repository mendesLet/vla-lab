from __future__ import annotations
from typing import Any, Dict, Callable, Optional

from distro import name


class EnvAPI:
    def __init__(self):
        self.move_group = None

    def detect_objects(self) -> dict:
    # Replace with perception pipeline call
        return {"objects": []}

    def get_obj_name_list(self) -> list[str]:
        return ["obj_a", "obj_b"]

    def move_to_pose(self, pose: list[float], speed: float = 0.1) -> dict:
    # Replace with real planner call
        return {"ok": True, "reached": pose, "speed": speed}

    def open_gripper(self) -> bool:
        return True

    def close_gripper(self) -> bool:
        return True

def get_attr_or_none(env: EnvAPI, name: str) -> Optional[Callable[..., Any]]:
    return getattr(env, name, None)

def build_fixed_vars(env: EnvAPI) -> Dict[str, Callable[..., Any]]:
    names = [
    "move_group",
    "get_object_center_position",
    "get_object_pose",
    "get_3d_bbox",
    "get_obj_name_list",
    "detect_objects",
    "get_object_joint_info",
    "parse_adaptive_shape_grasp_pose",
    "parse_horizontal_grasp_pose",
    "parse_place_pose",
    "get_gripper_pose",
    "open_gripper",
    "close_gripper",
    "attach_object",
    "detach_object",
    "move_to_pose",
    "move_in_direction",
    "generate_arc_path_around_joint",
    "follow_path",
    "grasp",
    ]
    d: Dict[str, Callable[..., Any]] = {}
    for k in names:
        attr = get_attr_or_none(env, k)
        if attr is not None:
            d[k] = attr
    return d