#!/bin/bash

echo "Airframes: Installing SoapySDR"

# SoapySDR
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq cmake g++ libpython3-dev python3-numpy swig < /dev/null > /dev/null

cd /opt/source
rm -rf SoapySDR
git clone https://github.com/pothosware/SoapySDR.git
cd SoapySDR
mkdir build
cd build
cmake ..
make -j4
sudo make install
sudo ldconfig
