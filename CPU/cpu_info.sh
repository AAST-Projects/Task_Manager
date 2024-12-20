#!/bin/bash
echo "CPU Performance is 55HZ"
python3 ./cpu_graph.py
X=$(echo "CPU is Nice")

zenity --info --title="CPU Performance" --text="$X"
