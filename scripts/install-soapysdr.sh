#!/bin/bash

# SoapySDR
sudo apt install -y cmake g++ libpython3-dev python3-numpy swig
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
