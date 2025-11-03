ARG BASE_IMAGE=panda_ros2_gazebo
FROM ${BASE_IMAGE}

SHELL ["/bin/bash","-c"]
ARG DEBIAN_FRONTEND=noninteractive

# build deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential wget xz-utils \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
    libffi-dev liblzma-dev uuid-dev tk-dev libgdbm-dev libnss3-dev \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# install your deps into the venv
COPY ./requirements.txt /tmp/requirements.txt
RUN if [ -s /tmp/requirements.txt ]; then python3.8 -m pip install -r /tmp/requirements.txt; fi

