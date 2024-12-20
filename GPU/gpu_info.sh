#!/bin/bash
echo "Fetching GPU Details"
gpu_util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
zenity --info --title="GPU" --text="Utilization = $gpu_util% \nTemperature = $gpu_temp C" 
