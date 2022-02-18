#!/bin/bash

echo "Airframes: Installing dumphfdl"

# dumphfdl
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq libsqlite3-dev libzmq3-dev < /dev/null > /dev/null

cd /opt/source
rm -rf statsd-c-client
git clone https://github.com/romanbsd/statsd-c-client.git
cd statsd-c-client
make
sudo make install
sudo ldconfig

cd /opt/source
rm -rf dumphfdl
git clone https://github.com/szpajder/dumphfdl.git
cd dumphfdl
mkdir build
cd build
cmake ..
make
sudo make install
