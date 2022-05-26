#!/bin/bash

ARCH=$(uname -m)
case $ARCH in
  armv7l|armv8|armhf)
    PLATFORM=ARM32
    SCRIPTS_TYPE=RPi
    SCRIPTS_VERSION=0.3
    API_VERSION=3.07.2
    ;;
  arm64|aarch64)
    PLATFORM=ARM64
    SCRIPTS_TYPE=RPi
    SCRIPTS_VERSION=0.3
    API_VERSION=3.07.2
    ;;
  *)
    PLATFORM=Linux
    SCRIPTS_TYPE=Linux
    SCRIPTS_VERSION=0.2
    API_VERSION=3.07.2
    ;;
esac

AUTOMATIC_SCRIPT="install-sdrplay-api-automatically.sh"
DOWNLOAD_SCRIPTS_FILE="SDRplay_${SCRIPTS_TYPE}_Scripts_v${SCRIPTS_VERSION}.zip"
DOWNLOAD_SCRIPTS_URL="https://www.sdrplay.com/software/${DOWNLOAD_SCRIPTS_FILE}"
DOWNLOAD_FIRMWARE_FILE="SDRplay_RSP_API-${PLATFORM}-${API_VERSION}.run"
DOWNLOAD_FIRMWARE_URL="https://www.sdrplay.com/software/${DOWNLOAD_FIRMWARE_FILE}"
BUILD_PATH="${BUILD_PATH:-/tmp/SDRplay}"

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

mkdir -p ${BUILD_PATH}
cd ${BUILD_PATH}
rm -rf SDRplay
mkdir SDRplay
cd SDRplay
wget -q $DOWNLOAD_SCRIPTS_URL
unzip -q $DOWNLOAD_SCRIPTS_FILE
sudo cp restartService.sh /usr/local/bin/restartSDRplay
sudo chmod 755 /usr/local/bin/restartSDRplay

wget -q ${DOWNLOAD_FIRMWARE_URL}
chmod 755 ./${DOWNLOAD_FIRMWARE_FILE}
if [ -f "./${AUTOMATIC_SCRIPT" ]; then
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq expect < /dev/null > /dev/null
  bash ${AUTOMATIC_SCRIPT} ./${DOWNLOAD_FIRMWARE_FILE}
elif [ -f "${BUILD_PATH}" -a -f "${BUILD_PATH}/image-dietpi" -a -f "${BUILD_PATH}/image-dietpi/scripts/install-sdrplay-api-automatically.sh" ]; then
  # image-dietpi specific (legacy)
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq expect < /dev/null > /dev/null
  /opt/source/image-dietpi/scripts/install-sdrplay-api-automatically.sh ./SDRplay_RSP_API-Linux-3.07.1.run
else
  ./${DOWNLOAD_FIRMWARE_FILE}
fi

sudo rm ${MORE_BINARY}
sudo mv ${MORE_BINARY}.old ${MORE_BINARY}
