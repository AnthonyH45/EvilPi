#!/bin/bash
nmcli -f in-use,ssid,bssid,chan dev wifi > networks.txt
num=0
awk -F " " '!seen[$1]++' networks.txt > test.txt
awk -F " " 'FNR > 1{print $1}' test.txt | grep ".*" -n > help.txt


