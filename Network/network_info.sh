#!/bin/bash
echo "Fetching Network Details..."
recieved=$(ifconfig enp0s3 | grep -i 'RX p'| awk '{print $3 " packets / " $5 " bytes"}')
transmitted=$(ifconfig enp0s3 | grep -i 'TX p'| awk '{print $3 " packets / " $5 " bytes"}')
dropped=$(ifconfig enp0s3 | grep -i 'TX e'| awk '{print $5 " packets"}')
zenity --info --title="Network" --text="Recieved = $recieved\nTransmitted = $transmitted\nDropped = $dropped"
