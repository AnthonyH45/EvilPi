#!/bin/bash
interface=$(cat interfaceToUse.txt)
airodump-ng $interface -w networks --write-interval 30 -o csv
