from launch import LaunchDescription
from launch_ros.actions import Node
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
import os

def generate_launch_description():
    gazebo_pkg = get_package_share_directory('ros_gz_sim')
    moveit_config_pkg = get_package_share_directory('panda_moveit_config')
    world = os.path.join(get_package_share_directory('panda_gazebo'), 'worlds', 'lab_world.sdf')

    return LaunchDescription([
        # Gazebo Harmonic
        IncludeLaunchDescription(
            PythonLaunchDescriptionSource(
                os.path.join(gazebo_pkg, 'launch', 'gz_sim.launch.py')),
            launch_arguments={'gz_args': f"-r -v 3 {world}"}.items(),
        ),

        # MoveIt 2 demo (brings RViz)
        IncludeLaunchDescription(
            PythonLaunchDescriptionSource(
                os.path.join(moveit_config_pkg, 'launch', 'moveit_rviz.launch.py')
            )
        ),
    ])
