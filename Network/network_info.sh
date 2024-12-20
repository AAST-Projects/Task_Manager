#!/bin/bash
echo "Network info is here"
./network_graph.py
X=$(whoami)
Y=$(pwd)
Z=$(git --version)
zenity --info --title="Network" --text="$X \n $Y \n $Z"
