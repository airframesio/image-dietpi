#!/bin/bash

echo "Airframes: Starting installer..."
./scripts/prep.sh
./scripts/install-libacars.sh
./scripts/install-sdrplay.sh
./scripts/install-airspy-drivers.sh
./scripts/install-soapysdr.sh
./scripts/install-soapysdr-airspy.sh
./scripts/install-soapysdr-sdrplay.sh
SoapySDRUtil --info
./scripts/install-dumphfdl.sh

cp scripts/run-hfdl.sh /usr/local/bin/airframes-run-hfdl.sh
chmod +x /usr/local/bin/airframes-run-hfdl.sh

./scripts/install-feeder-web.sh

echo "Airframes: Installer finished."
