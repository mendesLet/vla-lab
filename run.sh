# allow X from local containers (one-time per session)
xhost +local:root

# if you have NVIDIA GPU:
#   add: --gpus all --env=NVIDIA_VISIBLE_DEVICES=all --env=NVIDIA_DRIVER_CAPABILITIES=all
docker run -it --rm \
  --net=host \
  -e DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v $HOME/.Xauthority:/root/.Xauthority:ro \
  -v $HOME/code/residencia/catkin_ws:/ws:rw \
  --name robocodex_dev \
  robocodex:noetic
