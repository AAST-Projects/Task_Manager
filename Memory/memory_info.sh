#!/bin/bash
echo "Mmeory is 8 GB"
X=$(pwd)
Y=$(python3 --version)
Z=$(whoami)
zenity --info --title="Memory" --text="Memory Capacity is $X GB\nMemory Utilization is $Y %\nI am $Z"
