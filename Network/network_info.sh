#!/bin/bash
echo "Network info is here"
X=$(whoami)
Y=$(pwd)
Z=$(git --version)
zenity --info --title="Network" --text="$X \n $Y \n $Z"
