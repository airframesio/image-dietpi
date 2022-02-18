#!/bin/bash

echo "Airframes: Installing libacars"

# libacars
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq build-essential cmake pkg-config libglib2.0-dev libconfig++-dev libfftw3-dev git zlib1g-dev libxml2-dev < /dev/null > /dev/null

DISTRO=$(lsb_release -i)
echo $DISTRO
if [ "$DISTRO" != 'Ubuntu' ]; then
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq libliquid-dev < /dev/null > /dev/null
fi

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
