#!/bin/bash

echo "Airframes: Starting remote installer..."

HOME_PATH=`pwd`
SOURCE_PATH="${HOME_PATH}/source"
REPO_IMAGE_DIETPI="https://github.com/airframesio/image-dietpi.git"

mkdir ${SOURCE_DIR}
sudo apt update
sudo apt install -y apt-utils git

git clone $REPO_IMAGE_DIETPI ${SOURCE_PATH}/image-dietpi
cd ${SOURCE_PATH}/image-dietpi
./scripts/install.sh

echo "Airframes: Remote installer finished."
