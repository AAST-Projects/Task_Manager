#!/bin/bash

while true; do
    # Show the main menu
    selection=$(zenity --list \
        --title="Task Manager" \
        --text="Select a resource to monitor:" \
        --column="Options" "Graphs" "CPU" "GPU" "Disk" "Memory" "Network" "Exit")

    # Handle user selection
    case $selection in
        "Graphs")
            python graphs.py
            ;;
        "CPU")
            ./CPU/cpu_graph.py
            ./CPU/cpu_info.sh
            ;;
        "GPU")
            ./GPU/gpu_graph.py
            ./GPU/gpu_info.sh
            ;;
        "Disk")
            ./Disk/disk_graph.py
            ./Disk/disk_info.sh
            ;;
        "Memory")
            ./Memory/memory_graph.py
            ./Memory/memory_info.sh
            ;;
        "Network")
            ./Network/network_graph.py
            ./Network/network_info.sh
            ;;
        "Exit")
            exit 0
            ;;
        *)
            zenity --error --text="Invalid selection!"
            ;;
    esac
done

