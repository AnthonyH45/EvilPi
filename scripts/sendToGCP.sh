#!/bin/bash

scp *.cap root@34.83.108.72:/home/tony_hallak45/hashcat-5.1.0
rm -f *.cap

while [ true ];
do
	if [ -f password.txt ]; then
		echo "Password cracked."
		cat password.txt
		break
	fi

	if [ -f fail.txt ]; then
		echo "Password was not cracked"
		break
	fi
done
