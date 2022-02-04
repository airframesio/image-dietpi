#!/bin/bash

# sdrplay driver
sudo mv /usr/bin/more /usr/bin/more.old
sudo ln -s /usr/bin/cat /usr/bin/more

cd /opt/source
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
elif [ -f "/opt/source/image-dietpi/scripts/install-sdrplay-api-automatically.sh"]; then
  sudo apt install -y expect
  /opt/source/image-dietpi/scripts/install-sdrplay-api-automatically.sh ./SDRplay_RSP_API-Linux-3.07.1.run
else
  ./SDRplay_RSP_API-Linux-3.07.1.run
fi

sudo rm /usr/bin/more
sudo mv /usr/bin/more.old /usr/bin/more
