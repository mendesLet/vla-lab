FROM osrf/ros:noetic-desktop-full

# Basics + catkin tools + ROS pkgs the repo expects
RUN apt-get update && apt-get install -y --no-install-recommends \
    git python3-pip python3-vcstool python3-colcon-common-extensions \
    python3-catkin-tools build-essential cmake pkg-config \
    ros-noetic-moveit ros-noetic-gazebo-ros-pkgs \
    ros-noetic-franka-ros ros-noetic-image-pipeline \
    ros-noetic-rviz-visual-tools \
 && rm -rf /var/lib/apt/lists/*

# Python deps from the repo README
RUN pip3 install --no-cache-dir \
    numpy==1.23 astunparse scipy shapely pygments openai open3d \
    imageio==2.4.1 imageio-ffmpeg moviepy

# Workspace layout
ENV WS=/ws
RUN mkdir -p $WS/src
WORKDIR $WS/src

# You can also mount your repo at runtime instead of cloning
# (comment this out if you'll bind-mount the code)
RUN git clone --recurse-submodules https://github.com/RoboCodeX-source/RoboCodeX_code.git

# Build once in the image (or do it at runtime if you bind-mount)
WORKDIR $WS
SHELL ["/bin/bash", "-lc"]
RUN source /opt/ros/noetic/setup.bash && catkin init && catkin build

# Nice entrypoint: source ROS & workspace overlays for you
RUN echo 'source /opt/ros/noetic/setup.bash' >> /root/.bashrc && \
    echo 'if [ -f "/ws/devel/setup.bash" ]; then source /ws/devel/setup.bash; fi' >> /root/.bashrc
CMD ["bash"]
