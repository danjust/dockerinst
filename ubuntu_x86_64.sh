#!/bin/sh

"""Installs docker_ce for ubuntu"""

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Check for correct key
if sudo apt-key fingerprint 0EBFCD88 | grep -q Docker; then
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"

    sudo apt-get update

    sudo apt-get install docker-ce
else
    echo "key not found"
fi
