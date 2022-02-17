#!/bin/bash

# Prep
sudo mkdir /opt/source
DEBIAN_FRONTEND=noninteractive sudo apt-get update -qq
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qq apt-utils
