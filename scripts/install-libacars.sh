#!/bin/bash

# libacars
sudo apt install -y build-essential cmake pkg-config libglib2.0-dev libconfig++-dev libliquid-dev libfftw3-dev git

cd /opt/source
rm -rf libacars
git clone https://github.com/szpajder/libacars.git

cd libacars
apt install -y -qq zlib1g-dev libxml2-dev
mkdir build

cd build
cmake ..
make
sudo make install
sudo ldconfig
