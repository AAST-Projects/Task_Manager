#!/bin/bash
echo "Fetching Memory details"
total_memory=$(free -m | awk '/Mem:/ {print $2 " MB"}')
used_memory=$(free -m | awk '/Mem:/ {print $3 " MB"}')
free_memory=$(free -m | awk '/Mem:/ {print $4 " MB"}')
cached_memory=$(free -m | awk '/Mem:/ {print $6 " MB"}')
available_memory=$(free -m | awk '/Mem:/ {print $7 " MB"}')

zenity --info --width=200 --title="Memory" --text="Total Memory = $total_memory\nUsed Memory = $used_memory\nFree Memory = $free_memory\nCached Memory = $cached_memory\nAvailable Memory = $available_memory"
