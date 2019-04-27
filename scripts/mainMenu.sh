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
        echo "Enter attack option"
        echo "1 ) only capture handshakes"
        echo "2 ) only aggressive capture handshakes"
        echo "3 ) capture and send to GCP to crack"
        echo "4 ) aggressive capture and send to GCP to crack"
        echo "5 ) Evil Twin"
        echo "6 ) DeauthOption"
        read -r attackOption
        
        if [[ -z "$attackOption" ]]; then
            echo ""
            echo "Not a valid option"
            echo ""
        fi

        if [[ "$attackOption" == 1 ]]; then
            ./captureHandshakes.sh
        fi

        if [[ "$attackOption" == 2 ]]; then
            ./aggressiveCapture.sh
        fi

        if [[ "$attackOption" == 3 ]]; then
            ./captureHandshakes.sh
            ./sendToGCP.sh
        fi

        if [[ "$attackOption" == 4 ]]; then
            ./aggressiveCapture.sh
            ./sendToGCP.sh
        fi 

        if [[ "$attackOption" == 5 ]]; then
            ./evilTwin.sh
        fi

        if [[ "$attackOption" == 6 ]]; then
            ./deauth.sh
        fi
    fi

    if [[ "$option" == 3 ]]; then
        loop=false
    fi
done
