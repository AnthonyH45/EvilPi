#!/bin/bash

interface=$(airmon-ng | grep phy1 | awk '{print $2}')
sudo airmon-ng start $interface
