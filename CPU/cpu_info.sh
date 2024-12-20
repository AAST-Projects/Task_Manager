#!/bin/bash
echo "CPU Performance is 55HZ"
X=$(echo "CPU is Nice")

zenity --info --title="CPU Performance" --text="$X"
