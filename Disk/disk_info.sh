#!/bin/bash
echo "Fetching Disk Space..."
total_disk_space=$(df -h | grep '^/' | awk '{ print $2 }')
available_disk_space=$(df -h | grep '^/' | awk '{ print $4 }')
used_disk_space=$(df -h | grep '^/' | awk '{ print $3 }')
zenity --info --title="Disk Usage" --text="Disk Space = $total_disk_space\nAvailable = $available_disk_space\nUsed = $used_disk_space"

