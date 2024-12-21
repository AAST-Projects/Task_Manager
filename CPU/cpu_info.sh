#!/bin/bash

echo "Fetching CPU Details..."

# Get CPU utilization
cpu_util=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Get number of processes
cpu_processes=$(ps -e --no-headers | wc -l)

# Get number of threads (usually this will match the number of cores if hyper-threading is enabled)
cpu_threads=$(grep -c ^processor /proc/cpuinfo)

# Get CPU speed (in GHz)
cpu_speed=$(lscpu | grep -i "Model name" | awk '{print $8}')

# Get CPU temperature (if supported, requires lm-sensors installed)
if command -v sensors > /dev/null 2>&1; then
    cpu_temp=$(sensors | grep 'Core 0' | awk '{print $3}')
else
    cpu_temp="N/A (Temperature monitoring not supported)"
fi

# Display information in Zenity
zenity --info --width=300 --title="CPU" --text="CPU Utilization = $cpu_util%\nNumber of Processes = $cpu_processes\nNumber of Threads = $cpu_threads\nCPU Speed = $cpu_speed\nCPU Temperature = $cpu_temp"

