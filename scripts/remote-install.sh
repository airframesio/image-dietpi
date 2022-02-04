#!/bin/bash

REPO_IMAGE_DIETPI="https://github.com/airframesio/image-dietpi.git"

mkdir ~/source
sudo apt update
sudo apt install -y apt-utils git

git clone $REPO_IMAGE_DIETPI ${SOURCE_PATH}/image-dietpi
cd ~/source/image-dietpi
./scripts/install.sh
