import tkinter as tk
from tkinter import ttk
import psutil
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from collections import deque

# Initialize deque for real-time data
history_length = 50
cpu_data = deque([0] * history_length, maxlen=history_length)
memory_data = deque([0] * history_length, maxlen=history_length)
disk_data = deque([0] * history_length, maxlen=history_length)
network_data = deque([0] * history_length, maxlen=history_length)

# Create a Tkinter window
root = tk.Tk()
root.title("System Resource Monitoring")
root.geometry("800x600")

# Set up the Matplotlib figure
fig, (ax_cpu, ax_memory, ax_disk, ax_network) = plt.subplots(4, 1, figsize=(8, 8))
fig.suptitle("System Resource Monitoring")

# Embed the figure in the Tkinter window
canvas = FigureCanvasTkAgg(fig, master=root)
canvas_widget = canvas.get_tk_widget()
canvas_widget.pack(fill=tk.BOTH, expand=True)

def update(frame):
    # Get current system stats
    cpu_data.append(psutil.cpu_percent())
    memory_data.append(psutil.virtual_memory().percent)
    disk_data.append(psutil.disk_usage('/').percent)
    net_io = psutil.net_io_counters()
    network_data.append((net_io.bytes_sent + net_io.bytes_recv) / (1024 * 1024))  # MB/s

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
    ax_network.set_ylim(0, max(max(network_data), 1) * 1.2)
    ax_network.set_title("Network Usage")
    ax_network.legend()

    # Redraw the canvas
    canvas.draw()

# Set up the animation
ani = animation.FuncAnimation(fig, update, interval=1000)

# Start the Tkinter main loop
root.mainloop()

