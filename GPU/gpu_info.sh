#!/bin/bash
echo "GPU is 55 66"
./gpu_graph.py
Y=$(python3 --version)
zenity --info --title="GPU" --text="$Y \n GPU 66" 
