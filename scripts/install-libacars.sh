#!/bin/bash

echo "Airframes: Installing libacars"

# libacars
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qq build-essential cmake pkg-config libglib2.0-dev libconfig++-dev libliquid-dev libfftw3-dev git zlib1g-dev libxml2-dev < /dev/null > /dev/null

cd /opt/source
rm -rf libacars
git clone https://github.com/szpajder/libacars.git

cd libacars
mkdir build

cd build
cmake ..
make
sudo make install
sudo ldconfig
