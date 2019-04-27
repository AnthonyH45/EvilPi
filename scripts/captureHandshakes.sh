#!/bin/bash

echo "Enter the target's BSSID"
read -r vBSSID
echo "Enter the target's channel"
read -r vChannel

airodump-ng -c $vChannel --bssid $vBSSID -w psk wlan0mon
