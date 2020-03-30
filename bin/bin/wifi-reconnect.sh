#!/bin/bash#!/bin/bash

if ! [ "$(ping -c 1 google.com)" ]; then
    notify-send "wifi-reconnect.sh"
    service network-manager restart
fi
