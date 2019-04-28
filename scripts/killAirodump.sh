#!/bin/bash

psToKill=$(ps aux | grep airodump-ng | awk '{print $2}')
kill $psToKill
