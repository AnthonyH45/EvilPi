#!/bin/bash
interface=$(cat interfaceToUse.txt)
airodump-ng $interface -w networks --write-interval 30 -o csv & > /dev/null
PID=$!
wait(1000)
kill $PID
