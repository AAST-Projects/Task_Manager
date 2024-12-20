#!/bin/bash
echo "Disk Usage is 50 GB"
X=$(whoami)
Y=$(python3 --version)
Z=$(pwd)
zenity --info --title="Disk Usage" --text="$X\n$Y\n$Z"

