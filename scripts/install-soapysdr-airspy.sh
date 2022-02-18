#!/bin/bash

echo "Airframes:   - airspy"

# Soapy Airspy HF
cd /opt/source
rm -rf SoapyAirspyHF
git clone --quiet https://github.com/pothosware/SoapyAirspyHF.git
cd SoapyAirspyHF
mkdir build
cd build
cmake ..
make
sudo make install
