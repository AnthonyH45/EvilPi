#!/bin/bash

#cat targetList.txt | awk '{print "BSSD: "$1 "\nChannel: "$6 "\nCrypto: "$8 "\nSSID: "$11}'
targetBSSID=$(cat targetList.txt | awk '{print $1}')
targetChannel=$(cat targetList.txt | awk '{print $6}')
interface=$(cat interfaceToUse.txt)

airodump-ng -c $targetChannel --bssid $targetBSSID -w psk $interface
