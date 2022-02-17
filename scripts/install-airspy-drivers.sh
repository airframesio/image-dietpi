#!/bin/bash

# airspy driver
cd /opt/source
sudo apt install -y build-essential cmake libusb-1.0-0-dev pkg-config
rm -rf airspyone_host
git clone https://github.com/airspy/airspyone_host.git
cd airspyone_host
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig

# airspy hf+ driver
cd /opt/source
sudo apt install -y -qq build-essential cmake libusb-1.0-0-dev pkg-config
rm -rf airspyhf
git clone https://github.com/airspy/airspyhf.git
cd airspyhf
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig
