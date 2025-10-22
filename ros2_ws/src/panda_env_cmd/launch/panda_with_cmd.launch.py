from os import path
from typing import List

from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument, IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import (
    Command,
    FindExecutable,
    LaunchConfiguration,
    PathJoinSubstitution,
)
from launch_ros.actions import Node
from launch_ros.substitutions import FindPackageShare


def generate_launch_description() -> LaunchDescription:
    declared_arguments = generate_declared_arguments()

    description_package = LaunchConfiguration("description_package")
    description_filepath = LaunchConfiguration("description_filepath")
    world = LaunchConfiguration("world")
    model = LaunchConfiguration("model")
    use_sim_time = LaunchConfiguration("use_sim_time")
    ign_verbosity = LaunchConfiguration("ign_verbosity")
    log_level = LaunchConfiguration("log_level")

    # URDF
    _robot_description_xml = Command(
        [
            PathJoinSubstitution([FindExecutable(name="xacro")]),
            " ",
            PathJoinSubstitution(
                [FindPackageShare(description_package), description_filepath]
            ),
            " ",
            "name:=",
            model,
        ]
    )
    robot_description = {"robot_description": _robot_description_xml}

    # Include Ignition Gazebo
    ign = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            PathJoinSubstitution(
                [FindPackageShare("ros_ign_gazebo"), "launch", "ign_gazebo.launch.py"]
            )
        ),
        launch_arguments=[("ign_args", [world, " -v ", ign_verbosity])],
    )

    # Nodes
    rsp = Node(
        package="robot_state_publisher",
        executable="robot_state_publisher",
        output="log",
        arguments=["--ros-args", "--log-level", log_level],
        parameters=[
            robot_description,
            {"publish_frequency": 50.0, "frame_prefix": "", "use_sim_time": use_sim_time},
        ],
    )

    spawner = Node(
        package="ros_ign_gazebo",
        executable="create",
        output="log",
        arguments=["-file", model, "--ros-args", "--log-level", log_level],
        parameters=[{"use_sim_time": use_sim_time}],
    )

    cmd_server = Node(
        package="panda_env_cmd",
        executable="command_server",
        name="env_command_server",
        output="screen",
        parameters=[{"use_sim_time": use_sim_time}],
    )

    return LaunchDescription(declared_arguments + [ign, rsp, spawner, cmd_server])


def generate_declared_arguments() -> List[DeclareLaunchArgument]:
    return [
        DeclareLaunchArgument(
            "description_package",
            default_value="panda_description",
            description="Package with robot description.",
        ),
        DeclareLaunchArgument(
            "description_filepath",
            default_value=path.join("urdf", "panda.urdf.xacro"),
            description="Path to URDF/xacro relative to description_package share.",
        ),
        DeclareLaunchArgument(
            "world",
            default_value="default.sdf",
            description="Ignition world name or filepath.",
        ),
        DeclareLaunchArgument(
            "model",
            default_value="panda",
            description="Model name or SDF/URDF filepath to spawn.",
        ),
        DeclareLaunchArgument(
            "use_sim_time",
            default_value="true",
            description="Use simulated clock.",
        ),
        DeclareLaunchArgument(
            "ign_verbosity",
            default_value="3",
            description="Ignition Gazebo verbosity (0–4).",
        ),
        DeclareLaunchArgument(
            "log_level",
            default_value="warn",
            description="ROS 2 log level for nodes.",
        ),
    ]