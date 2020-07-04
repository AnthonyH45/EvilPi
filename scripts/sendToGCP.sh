#!/bin/bash

scp *.cap root@<IP>:/home/tony_hallak45/hashcat-5.1.0
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
