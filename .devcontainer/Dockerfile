FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

ARG DOCKER_UID
ARG DOCKER_GID
RUN groupadd -r docker-user -g $DOCKER_GID && useradd -r -u $DOCKER_UID -g $DOCKER_GID -m -s /bin/false -g docker-user docker-user

RUN apt update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y \
    # Devcontainer tools
    git sudo vim \
    # Compile deps (https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu)
    autoconf automake build-essential cmake git-core libass-dev libfreetype6-dev libgnutls28-dev libmp3lame-dev libsdl2-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev meson ninja-build pkg-config texinfo wget yasm zlib1g-dev \
    # nvidia cuda deps (https://docs.nvidia.com/video-technologies/video-codec-sdk/ffmpeg-with-nvidia-gpu/)
    libc6 libc6-dev unzip wget libnuma1 libnuma-dev \
    # x264 dep (https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#libx264)
    libx264-dev

RUN passwd -d docker-user && adduser docker-user sudo

RUN git clone https://github.com/FFmpeg/nv-codec-headers.git && cd nv-codec-headers && make install

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

USER $DOCKER_UID:$DOCKER_GID