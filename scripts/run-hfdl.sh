#!/bin/bash

DRIVER="sdrplay"
DEVICE_SETTINGS="biasT_ctrl=false"
#DEVICE_SETTINGS="biasT_ctrl=false,rfgain_sel=1,agc_setpoint=-15"
#SAMPLE_RATE="912000"
#SAMPLE_RATE="2000000"
SAMPLE_RATE="5000000"
STATION_ID="KE-HFDL2"

SYSTEM_TABLE="/root/source/dumphfdl/etc/systable.conf"

#FREQ_5M="5508 5514"
FREQ_5M="5502 5508 5514 5451 5529 5538 5544 5547 5583 5589 5622 5652 5655 5720"
#FREQ_5M="5508 5514 5538 5544 5622"
#FREQ_6M="6559 6565 6661"
FREQ_6M="6529 6532 6535 6559 6565 6589 6596 6619 6628 6646 6652 6661 6712"
#FREQ_6M="6559 6565 6589 6619 6661"
FREQ_8M="8834 8843 8885 8886 8894 8912 8921 8925 8927 8936 8939 8942 8948 8957 8977"
FREQ_10M="10027 10060 10063 10066 10075 10081 10084 10087 10093"
FREQ_11M="11184 11306 11312 11318 11321 11327 11348 11354 11384 11387"
FREQ_13M="13264 13270 13276 13303 13312 13315 13321 13342 13351 13354"
FREQ_21M="21928 21931 21934 21937 21949 21955 21982 21990 21997"

if [ "$1" = "5M" ]; then
  FREQUENCIES="$FREQ_5M"
elif [ "$1" = "6M" ]; then
  FREQUENCIES="$FREQ_6M"
elif [ "$1" = "8M" ]; then
  FREQUENCIES="$FREQ_8M"
elif [ "$1" = "10M" ]; then
  FREQUENCIES="$FREQ_10M"
elif [ "$1" = "11M" ]; then
  FREQUENCIES="$FREQ_11M"
elif [ "$1" = "13M" ]; then
  FREQUENCIES="$FREQ_13M"
elif [ "$1" = "21M" ]; then
  FREQUENCIES="$FREQ_21M"
elif [ "$1" = "5M+6M" ]; then
  FREQUENCIES="$FREQ_5M $FREQ_6M"
elif [ "$1" = "5M+6M+8MM" ]; then
  FREQUENCIES="$FREQ_5M $FREQ_6M $FREQ_8M"
elif [ "$1" = "5M+6M+8M+10M" ]; then
  FREQUENCIES="$FREQ_5M $FREQ_6M $FREQ_8M $FREQ_10M"
elif [ "$1" = "5M+6M+8M+10M+11M" ]; then
  FREQUENCIES="$FREQ_5M $FREQ_6M $FREQ_8M $FREQ_10M $FREQ_11M"
elif [ "$1" = "5M+6M+8M+10M+11M+13M" ]; then
  FREQUENCIES="$FREQ_5M $FREQ_6M $FREQ_8M $FREQ_10M $FREQ_11M $FREQ_13M"
elif [ "$1" = "8M+10M" ]; then
  FREQUENCIES="$FREQ_8M $FREQ_10M"
elif [ "$1" = "10M+11M" ]; then
  FREQUENCIES="$FREQ_10M $FREQ_11M"
elif [ "$1" = "11M+13M" ]; then
  FREQUENCIES="$FREQ_11M $FREQ_13M"
elif [ "$1" = "all" ]; then
  FREQUENCIES="$FREQ_5M $FREQ_6M $FREQ_8M $FREQ_10M $FREQ_11M $FREQ_13M $FREQ_21M"
else
  echo "You must specify a frequency band plan to use: 5M, 6M, 8M, 10M, 11M, 13M, 21M, 5M+6M, 8M+10M, 10M+11M, 11M+13M, all"
  exit 1
fi

echo "Killing any existing dumphfdl instances..."
pkill -9 -f dumphfdl
sleep 3

echo "Starting dumphfdl ($FREQUENCIES)..."
dumphfdl \
  --soapysdr driver=$DRIVER \
  --device-settings $DEVICE_SETTINGS \
  --sample-rate $SAMPLE_RATE \
  --system-table $SYSTEM_TABLE --system-table-save ${SYSTEM_TABLE}.new \
  --output-mpdus \
  --station-id $STATION_ID \
  --output decoded:text:file:path=- \
  --output decoded:text:zmq:mode=server,endpoint=tcp://*:5555 \
  ${FREQUENCIES}

#  --statsd 192.168.30.20:8125 \
#  --output decoded:text:tcp:address=192.168.40.11,port=5581 \
