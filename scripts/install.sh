#!/bin/bash

# Prep
mkdir ~/source
sudo apt update
sudo apt install apt-utils

# sdrplay driver
cd ~/source
rm -rf SDRplay
mkdir SDRplay
cd SDRplay
wget https://www.sdrplay.com/software/SDRplay_Linux_Scripts_v0.2.zip
unzip SDRplay_Linux_Scripts_v0.2.zip
sudo cp restartService.sh /usr/local/bin/restartSDRplay
sudo chmod 755 /usr/local/bin/restartSDRplay
wget https://www.sdrplay.com/software/SDRplay_RSP_API-Linux-3.07.1.run
chmod 755 ./SDRplay_RSP_API-Linux-3.07.1.run
if [ -f "/tmp/install-sdrplay-api-automatically.sh" ]; then
  sudo apt install -y expect
  /tmp/install-sdrplay-api-automatically.sh ./SDRplay_RSP_API-Linux-3.07.1.run
else
  ./SDRplay_RSP_API-Linux-3.07.1.run
fi

# libacars
sudo apt install -y build-essential cmake pkg-config libglib2.0-dev libconfig++-dev libliquid-dev libfftw3-dev git
cd ~/source
rm -rf libacars
git clone https://github.com/szpajder/libacars.git
cd libacars
apt install -y zlib1g-dev libxml2-dev
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig

# airspy driver
cd ~/source
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
cd ~/source
sudo apt install -y build-essential cmake libusb-1.0-0-dev pkg-config
rm -rf airspyhf
git clone https://github.com/airspy/airspyhf.git
cd airspyhf
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig

# SoapySDR
sudo apt install -y cmake g++ libpython3-dev python3-numpy swig
cd ~/source
rm -rf SoapySDR
git clone https://github.com/pothosware/SoapySDR.git
cd SoapySDR
mkdir build
cd build
cmake ..
make -j4
sudo make install
sudo ldconfig

# Soapy Airspy HF
cd ~/source
rm -rf SoapyAirspyHF
git clone https://github.com/pothosware/SoapyAirspyHF.git
cd SoapyAirspyHF
mkdir build
cd build
cmake ..
make
sudo make install

# Soapy SDR Play
cd ~/source
rm -rf SoapySDRPlay
git clone https://github.com/pothosware/SoapySDRPlay.git
cd SoapySDRPlay
mkdir build
cd build
cmake ..
make
sudo make install

SoapySDRUtil --info

# dumphfdl
sudo apt install libsqlite3-dev libzmq3-dev
cd ~/source
rm -rf statsd-c-client
git clone https://github.com/romanbsd/statsd-c-client.git
cd statsd-c-client
make
sudo make install
sudo ldconfig
cd ~/source
rm -rf dumphfdl
git clone https://github.com/szpajder/dumphfdl.git
cd dumphfdl
mkdir build
cd build
cmake ..
make
sudo make install
