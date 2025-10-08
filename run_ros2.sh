xhost +local:root

docker run -it --rm \
    --net=host \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume=$HOME/.Xauthority:/root/.Xauthority:ro \
    --volume=$PWD/ros2_ws:/root/ros2_panda_ws \
    --name ros2_panda_sim \
    ros2_panda_sim