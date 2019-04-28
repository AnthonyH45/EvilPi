#!/bin/bash

cat targetList.txt | awk '{print "BSSD: "$1 "\nChannel: "$6 "\nCrypto: "$8 "\nSSID: "$11}'
