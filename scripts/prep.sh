#!/bin/bash

# Prep
sudo mkdir /opt/source
DEBIAN_FRONTEND=noninteractive sudo apt-get update -qq < /dev/null > /dev/null
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qq apt-utils < /dev/null > /dev/null
