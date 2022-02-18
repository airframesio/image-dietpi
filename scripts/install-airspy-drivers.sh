#!/bin/bash

echo "Airframes: Installing Airspy drivers"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq build-essential cmake libusb-1.0-0-dev pkg-config < /dev/null > /dev/null

# airspy driver
echo "Airframes:   - airspy"
cd /opt/source
rm -rf airspyone_host
git clone --quiet https://github.com/airspy/airspyone_host.git
cd airspyone_host
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig

# airspy hf+ driver
echo "Airframes:   - airspyhf"
cd /opt/source
rm -rf airspyhf
git clone --quiet https://github.com/airspy/airspyhf.git
cd airspyhf
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig
