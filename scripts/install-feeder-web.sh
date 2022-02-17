#!/bin/bash

# lighttpd
DEBIAN_FRONTEND=noninteractive apt install -qq lighttpd

# feeder web content
git -C /var/www/html clone https://github.com/airframesio/feeder-web.git
