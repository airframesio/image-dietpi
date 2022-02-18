#!/bin/bash

echo "Airframes: Installing airframes feeder-web"

# lighttpd
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq lighttpd < /dev/null > /dev/null

# feeder web content
git -C /var/www/html clone https://github.com/airframesio/feeder-web.git
