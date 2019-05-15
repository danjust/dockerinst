#!/bin/sh

"""Script installs nvidia_docker2 in a linux environment
Prerequisites:
Docker >= 1.12
NVIDIA gpu
NVIDIA drivers
see https://github.com/NVIDIA/nvidia-docker for details
"""

# Add the package repositories
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/amd64/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

# Install nvidia-docker2 and reload the Docker daemon configuration
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd

# To test run nvidia-smi with the latest official CUDA image:
# docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi
