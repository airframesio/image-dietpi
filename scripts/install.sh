#!/bin/bash

./scripts/prep.sh
./scripts/install-libacars.sh
./scripts/install-sdrplay.sh
./scripts/install-airspy-drivers.sh
./scripts/install-soapysdr.sh
./scripts/install-soapysdr-airspy.sh
./scripts/install-soapysdr-sdrplay.sh
SoapySDRUtil --info
./scripts/install-dumphfdl.sh
