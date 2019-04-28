#!/bin/bash

interface=$(airmon-ng | grep "Atheros" | awk '{print $2}')
sudo airmon-ng start $interface > /dev/null
echo $interface > interfaceToUse.txt 
