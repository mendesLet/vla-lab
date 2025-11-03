#!/usr/bin/env bash
set -e

xhost +local:root

docker run -it --rm \
  --gpus all \
  --privileged \
  --ipc=host --shm-size=2g \
  --workdir /root/workspace \
  --network host \
  -e DISPLAY="$DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v "$(pwd)/ros_packages":/root/workspace/src \
  panda_ros2_gazebo:v0.5