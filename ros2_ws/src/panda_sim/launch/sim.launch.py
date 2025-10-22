from launch import LaunchDescription
from launch.actions import ExecuteProcess, SetEnvironmentVariable, TimerAction
from ament_index_python.packages import get_package_share_directory
import os

def generate_launch_description():
    sim_share   = get_package_share_directory('panda_sim')
    panda_share = get_package_share_directory('panda')  # from the repo
    desc_share  = get_package_share_directory('panda_description')  # meshes/URDF

    world = os.path.join(sim_share, 'worlds', 'empty.sdf')
    model = os.path.join(desc_share, 'panda', 'model.sdf')

    # Gazebo resource search paths (Fortress)
    resource_paths = f"{panda_share}:{desc_share}:{sim_share}"
    set_ign = SetEnvironmentVariable('IGN_GAZEBO_RESOURCE_PATH', resource_paths)
    set_gz  = SetEnvironmentVariable('GZ_SIM_RESOURCE_PATH', resource_paths)  # optional

    ign = ExecuteProcess(cmd=['ign', 'gazebo', world, '-v', '3'], output='screen')

    spawn = ExecuteProcess(
        cmd=['ros2','run','ros_gz_sim','create',
             '-file', model, '-name', 'panda',
             '-x','0','-y','0','-z','0.8'],
        output='screen'
    )

    # Load controllers after the entity exists
    jsb  = ExecuteProcess(cmd=['ros2','control','load_controller','--set-state','active','joint_state_broadcaster'])
    arm  = ExecuteProcess(cmd=['ros2','control','load_controller','--set-state','active','arm_controller'])
    hand = ExecuteProcess(cmd=['ros2','control','load_controller','--set-state','active','hand_controller'])
    delayed = TimerAction(period=3.0, actions=[jsb, arm, hand])

    return LaunchDescription([set_ign, set_gz, ign, spawn, delayed])
