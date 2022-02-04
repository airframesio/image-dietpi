#!/bin/bash

# dumphfdl
sudo apt install libsqlite3-dev libzmq3-dev
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
