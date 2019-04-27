#!/bin/bash

psToKill=$(ps aux | grep airodump-ng | awk '{print $1}')
kill $psToKill
