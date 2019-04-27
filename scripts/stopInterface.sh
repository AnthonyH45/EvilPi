#!/bin/bash

interface=$(cat interfaceToUse.txt)
sudo airmon-ng stop $interface > /dev/null
