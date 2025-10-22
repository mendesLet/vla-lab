# Build
# docker build -t panda-humble-fortress -f Dockerfile.ros2 .

# X11/Wayland GUI: allow Gazebo/RViz to show (Linux/X11 example)
xhost +local:root
docker run -it --rm \
  --env="DISPLAY=$DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --volume="$PWD/ros2_ws:/opt/ws_panda" \
  --network=host \
  --name panda_sim \
  panda-arm
