#!/bin/bash

scp root@34.83.108.72:/home/tony_hallak45/hashcat-5.1.0/Return.txt Return.txt

while [ true ];
do
	if [ -f Return.txt ]; then
		echo "Password cracked."
		cat Return.txt
		break
	fi

	if [ -f fail.txt ]; then
		echo "Password was not cracked"
		break
	fi
done
