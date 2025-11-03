# VLA Lab

This is a repository purely for educational porpuse made during the last semester of my AI Bachalor. Visual Language Action model is any input data turn into action tokens that will become action in a real/simulated robot. In specific this repository works with code generation through LLM, where the action tokens are a sequency of actions (through APIs) in code format.
This is heavly inspired by the work of [RoboCodeX](https://github.com/RoboCodeX-source/RoboCodeX_code/tree/main)

## Features

- ROS2 Foxy
- API control for the panda arm using the repository [Panda ROS2 Gazebo](https://github.com/mendesLet/panda_ros2_gazebo)
- Code Generation Through LLMs
    - OpenAI application (Cloud)
    - Ollama application (Local)

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Architecture overview](#architecture-overview)


## Prerequisites

- Python 3.10+
- OpenAI API Key
- GPU (Cuda 11+)
- Docker Engine 24.0+

## Installation

Docker development
```bash
docker build -f docker/Dockerfile -t panda_ros2_gazebo:v0.1
chmod +x ./run.sh
./run.sh
```

Setup Dependency Packages (inside docker)
```bash
cd /root/workspace/src
vcs import < panda_ros2_gazebo/workspace.repos
```

Colcon Build (inside docker)
```bash
source /opt/ros/${ROS2_DISTRO}/setup.bash
export COLCON_PYTHON_EXECUTABLE=/usr/bin/python3.8
colcon build --merge-install --cmake-args -DIDYNTREE_USES_PYTHON=True -DPYTHON_EXECUTABLE=/usr/bin/python3.8 -DIDYNTREE_USES_IPOPT:BOOL=ON -DCMAKE_BUILD_TYPE=Release
```

## Configuration

Create a `.env` file in the root directory with the following structure:
```plaintext
OPENAI_API_KEY=<your_key>
```

## Architecture overview
```mermaid
```
