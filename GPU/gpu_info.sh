#!/bin/bash

# Fetching GPU Details
echo "Fetching GPU Details..."

# Get GPU utilization percentage
gpu_util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)

# Get GPU temperature in Celsius
gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

# Get GPU memory usage in a readable format
gpu_memory=$(nvidia-smi --query-gpu=memory.free,memory.used,memory.total --format=csv,noheader,nounits)

# Display the gathered information using Zenity
zenity --info --title="GPU" --text="GPU Memory = ${gpu_memory//,/} MiB\nUtilization = ${gpu_util}%\nGPU Temperature = ${gpu_temp} C"

