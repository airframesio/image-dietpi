#!/bin/bash

echo "Airframes: Starting remote installer..."

SOURCE_PATH="/opt/source"
REPO_IMAGE_DIETPI="https://github.com/airframesio/image-dietpi.git"

sudo mkdir ${SOURCE_PATH}
sudo apt update
sudo apt install -y apt-utils git

git clone $REPO_IMAGE_DIETPI ${SOURCE_PATH}/image-dietpi
cd ${SOURCE_PATH}/image-dietpi
./scripts/install.sh

echo "Airframes: Remote installer finished."
