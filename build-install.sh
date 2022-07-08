#!/bin/bash

docker build -f .devcontainer/Dockerfile --target ffmpeg-install -t tobias/deep-rpa-ffmpeg --build-arg DOCKER_UID=`id -u` --build-arg DOCKER_GID=`id -g` .
