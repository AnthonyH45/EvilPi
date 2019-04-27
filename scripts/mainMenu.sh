#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Script must be run as root"
    exit 1
fi

loop=true

while [ $loop = true ]
do
    echo ""
    echo "Please select an option:"
    echo "1 ) Show Networks"
    echo "2 ) Attack Networks"
    echo "3 ) quit"
    echo ""
    read -r option

    if [[ -z "$option" ]]; then
        echo ""
        echo "Not a valid option"
        echo ""
    fi

    if [[ "$option" == 1 ]]; then 
        ./showNetworks.sh > interfaces.txt
        echo "available networks: " 
            for i in 'cat interfaces.txt'; do 
                awk '{print $2}' 
            done
    fi

    if [[ "$option" == 2 ]]; then
        echo ""
        echo "Enter BSSID: "
        read -r victimBSSID
        echo "Enter channel: "
        read -r victimChannel
        echo ""
    fi

    if [[ "$option" == 3 ]]; then
        loop=false
    fi
done
