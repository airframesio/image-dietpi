#!/bin/bash

echo "Airframes: Installing SDRPlay drivers"

DISTRO=$(lsb_release -s -i)
echo $DISTRO
if [ "$DISTRO" == 'Ubuntu' ]; then
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq libudev-dev < /dev/null > /dev/null
fi

# sdrplay driver
MORE_BINARY=$(which more)
CAT_BINARY=$(which cat)
sudo mv ${MORE_BINARY} ${MORE_BINARY}.old
sudo ln -s ${CAT_BINARY} ${MORE_BINARY}

cd /opt/source
rm -rf SDRplay
mkdir SDRplay
cd SDRplay
wget -q https://www.sdrplay.com/software/SDRplay_Linux_Scripts_v0.2.zip
unzip -q SDRplay_Linux_Scripts_v0.2.zip
sudo cp restartService.sh /usr/local/bin/restartSDRplay
sudo chmod 755 /usr/local/bin/restartSDRplay

wget -q https://www.sdrplay.com/software/SDRplay_RSP_API-Linux-3.07.1.run
chmod 755 ./SDRplay_RSP_API-Linux-3.07.1.run
if [ -f "/tmp/install-sdrplay-api-automatically.sh" ]; then
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq expect < /dev/null > /dev/null
  /tmp/install-sdrplay-api-automatically.sh ./SDRplay_RSP_API-Linux-3.07.1.run
elif [ -f "/opt/source/image-dietpi/scripts/install-sdrplay-api-automatically.sh" ]; then
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq expect < /dev/null > /dev/null
  /opt/source/image-dietpi/scripts/install-sdrplay-api-automatically.sh ./SDRplay_RSP_API-Linux-3.07.1.run
else
  ./SDRplay_RSP_API-Linux-3.07.1.run
fi

sudo rm ${MORE_BINARY}
sudo mv ${MORE_BINARY}.old ${MORE_BINARY}
