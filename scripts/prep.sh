#!/bin/bash

echo "Airframes: Preparations"

# Prep
sudo mkdir /opt/source
sudo DEBIAN_FRONTEND=noninteractive apt-get update -qq < /dev/null > /dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq apt-utils wget unzip lsb-release < /dev/null > /dev/null
