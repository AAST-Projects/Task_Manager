#!/bin/bash
echo "Mmeory is 8 GB"
./memory_graph.py
X=$(du)
Y=$(python3 --version)
Z=$(whoami)
zenity --info --title="Memory" --text="Memory Capacity is $X GB\nMemory Utilization is $Y %\nI am $Z"