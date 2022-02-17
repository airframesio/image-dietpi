#!/bin/bash

echo "Airframes: Installing airframes feeder-web"

# lighttpd
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qq lighttpd < /dev/null > /dev/null

# feeder web content
git -C /var/www/html clone https://github.com/airframesio/feeder-web.git
