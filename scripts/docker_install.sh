#!/bin/bash
ulimit -c 0
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y software-properties-common

#build open3d headless
# apt-get install -y libwayland-dev libxkbcommon-x11-dev xorg-dev libglu1-mesa-dev
# apt-get install -y --no-install-recommends \
#     libegl1 \
#     libgl1 \
#     libgomp1 libc++-dev libc++abi-dev

apt-get install -y libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev \
    freeglut3-dev libosmesa6-dev libyaml-dev git wget libglib2.0-0 \
    libavcodec-dev libavformat-dev libavutil-dev libswscale-dev \
    libavfilter-dev libx264-dev libx265-dev libopus-dev \
    pkg-config

rm -rf /opt/conda/bin/ffmpeg
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

# cd downloads/Open3D
# echo "Installing Open3D"
# mkdir -p build && cd build
# cmake ..
# make -j$(nproc)
# make install-pip-package