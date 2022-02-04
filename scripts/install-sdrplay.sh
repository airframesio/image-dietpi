#!/bin/bash

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
elif [ -f "~/source/image-dietpi/scripts/install-sdrplay-api-automatically.sh"]; then
  ~/source/image-dietpi/scripts/install-sdrplay-api-automatically.sh ./SDRplay_RSP_API-Linux-3.07.1.run
else
  ./SDRplay_RSP_API-Linux-3.07.1.run
fi
