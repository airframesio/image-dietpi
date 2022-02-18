#!/bin/bash

echo "Airframes: Starting remote installer..."

SOURCE_PATH="/opt/source"
REPO_IMAGE_DIETPI="https://github.com/airframesio/image-dietpi.git"

sudo mkdir -p ${SOURCE_PATH}
sudo DEBIAN_FRONTEND=noninteractive apt-get update -qq < /dev/null > /dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq apt-utils git < /dev/null > /dev/null

git clone --quiet $REPO_IMAGE_DIETPI ${SOURCE_PATH}/image-dietpi
cd ${SOURCE_PATH}/image-dietpi
./scripts/install.sh

echo "Airframes: Remote installer finished."
