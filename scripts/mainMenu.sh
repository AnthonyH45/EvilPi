#!/bin/bash

loop=true

if [[ $EUID -ne 0 ]]; then
    echo "\nScript must be run as root\n"
    exit 1
fi

while [ loop ] do
    echo "\nPlease select an option:"
    echo "1 ) Show Networks"
    echo "2 ) Attack Networks"
    echo "3 ) quit"
    read -r option

    if [[ -z "$option" ]]; then
        echo "Not a valid option"
    fi

    if [[ "$option" == 1 ]]; then 
        ./showNetworks.sh > interfaces.txt
        echo "available networks: " for i in 'cat interfaces.txt'; do echo $2; done
    fi

    if [[ "$option" == 2 ]]; then
        
    fi

    if [[ "$option" == 3 ]]; then
        loop = false
    fi

done
