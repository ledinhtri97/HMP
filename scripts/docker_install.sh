#!/bin/bash

apt-get update
apt-get install -y libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev \
    freeglut3-dev libosmesa6-dev libyaml-dev git wget libglib2.0-0 \
  libavcodec-dev libavformat-dev libavutil-dev libswscale-dev \
  libavfilter-dev libavdevice-dev libpostproc-dev \
  libx264-dev libx265-dev libvpx-dev libfdk-aac-dev libopus-dev \
  libmp3lame-dev yasm pkg-config
apt-get install -y ffmpeg

python -m pip install --upgrade pip
pip install Cython fvcore gdown openmim ninja

pip install -r requirements.txt


mim install mmengine
mim install "mmcv==2.1.0"
mim install "mmdet==3.2.0"

cd external/mmpose
echo "Installing mmpose"
pip install -r requirements.txt
pip install -v -e .
cd ../..

