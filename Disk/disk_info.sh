#!/bin/bash
echo "Disk Usage is 50 GB"
./disk_graph.py
X=$(whoami)
Y=$(python3 --version)
Z=$(pwd)
zenity --info --title="Disk Usage" --text="$X\n$Y\n$Z"

