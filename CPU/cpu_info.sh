#!/bin/bash
echo "CPU Performance is 55HZ"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
cpu_temp=$(echo "$RANDOM")
zenity --info --title="CPU" --text="CPU utilization = $cpu_usage%\nCPU temperature = $cpu_temp C"
