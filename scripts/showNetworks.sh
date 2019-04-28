#!/bin/bash
nmcli -f in-use,ssid,bssid,chan dev wifi > networks.txt
