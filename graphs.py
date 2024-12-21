import psutil
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from collections import deque

# Initialize deque for real-time data
history_length = 50
cpu_data = deque([0] * history_length, maxlen=history_length)
memory_data = deque([0] * history_length, maxlen=history_length)
disk_data = deque([0] * history_length, maxlen=history_length)
network_data = deque([0] * history_length, maxlen=history_length)
ethernet_data = deque([0] * history_length, maxlen=history_length)

# Set up the plot
fig, (ax_cpu, ax_memory, ax_disk, ax_network) = plt.subplots(4, 1, figsize=(10, 10))
fig.suptitle("System Resource Monitoring")

def update(frame):
    # Get current system stats
    cpu_data.append(psutil.cpu_percent())
    memory_data.append(psutil.virtual_memory().percent)
    disk_data.append(psutil.disk_usage('/').percent)

    # Calculate network usage (bytes sent and received per second)
    net_io = psutil.net_io_counters()
    network_data.append((net_io.bytes_sent + net_io.bytes_recv) / (1024 * 1024))  # MB/s

    # Calculate Ethernet usage if available
    ethernet_counters = psutil.net_if_stats().get('Ethernet')
    ethernet_data.append(ethernet_counters.speed if ethernet_counters else 0)

    # Update CPU plot
    ax_cpu.clear()
    ax_cpu.plot(cpu_data, label="CPU Usage (%)", color="blue")
    ax_cpu.set_ylim(0, 100)
    ax_cpu.set_title("CPU Usage")
    ax_cpu.legend()

    # Update Memory plot
    ax_memory.clear()
    ax_memory.plot(memory_data, label="Memory Usage (%)", color="green")
    ax_memory.set_ylim(0, 100)
    ax_memory.set_title("Memory Usage")
    ax_memory.legend()

    # Update Disk plot
    ax_disk.clear()
    ax_disk.plot(disk_data, label="Disk Usage (%)", color="red")
    ax_disk.set_ylim(0, 100)
    ax_disk.set_title("Disk Usage")
    ax_disk.legend()

    # Update Network plot
    ax_network.clear()
    ax_network.plot(network_data, label="Network Usage (MB/s)", color="purple")
    ax_network.plot(ethernet_data, label="Ethernet Speed (Mbps)", color="orange")
    ax_network.set_ylim(0, max(max(network_data), max(ethernet_data), 1) * 1.2)
    ax_network.set_title("Network Usage")
    ax_network.legend()

# Animate the plots
ani = animation.FuncAnimation(fig, update, interval=1000)

# Display the plot
plt.tight_layout()
plt.show()
