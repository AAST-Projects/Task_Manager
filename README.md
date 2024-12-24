# Task Manager

A Bash scripting-based project designed to emulate a simplified version of the Windows Task Manager. It utilizes Zenity for a graphical user interface and Docker for portability, allowing users to view system metrics like CPU, GPU, memory, disk, and network statistics.

## Features
- Displays system metrics such as:
  - CPU utilization, temperature, number of processes, threads, and speed.
  - GPU utilization, temperature, and memory usage.
  - Memory usage (total, used, and free).
  - Disk usage (total, used, and available).
  - Network statistics (received and transmitted data).
- Simple GUI built using Zenity.
- Lightweight and portable through Docker.

## Prerequisites
- **Linux-based OS**
- **Docker** installed on your machine ([Get Docker](https://docs.docker.com/get-docker/))
- **X server** setup (for GUI display, e.g., XQuartz for macOS or Xming for Windows)
- **NVIDIA drivers** and `nvidia-smi` for GPU statistics (if applicable)

## Setup

### Clone the Repository
```bash
git clone https://github.com/AAST-Projects/Task_Manager.git
cd Task_Manager
```

This repository has two branches:
- `main`: The stable version of the project.
- `dev`: Development branch with ongoing changes.

Switch between branches as needed:
```bash
git checkout dev
```

### Pull Docker Image
To save time, you can pull the prebuilt Docker image from Docker Hub:
```bash
docker pull mohamedeid123/task_manager:latest
```

### Build Docker Image (Optional)
If you want to build the Docker image locally, run:
```bash
docker build -t task_manager .
```

## Running the Application

### On Linux
1. Allow Docker to access the X server:
   ```bash
   xhost +local:docker
   ```
2. Run the Docker container:
   ```bash
   docker run -dit --name system -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix mohamedeid123/task_manager:latest
   ```
3. Access the running container:
   ```bash
   docker exec -it system bash
   ```
4. Inside the container, launch the application:
   ```bash
   ./main.sh
   ```

### On Windows
1. Install and configure an X server (e.g., [Xming](https://sourceforge.net/projects/xming/)).
2. Share the X server display by setting the `DISPLAY` environment variable:
   ```bash
   set DISPLAY=<your-machine-ip>:0.0
   ```
3. Run the Docker container with the updated `DISPLAY` variable:
   ```bash
   docker run -dit --name system -e DISPLAY=<your-machine-ip>:0.0 -v /tmp/.X11-unix:/tmp/.X11-unix mohamedeid123/task_manager:latest
   ```
4. Follow the Linux steps from Step 3.

## Project Structure
```plaintext
Task_Manager/
├── Dockerfile          # Docker configuration file
├── main.sh             # Main script to run the application
├── cpu_info.sh         # Script to fetch CPU details
├── gpu_info.sh         # Script to fetch GPU details
├── memory_info.sh      # Script to fetch Memory details
├── disk_info.sh        # Script to fetch Disk details
├── network_info.sh     # Script to fetch Network details
├── README.md           # Project documentation
```

## Example Outputs
- **CPU Metrics**: Utilization, temperature, speed, number of processes, and threads.
- **GPU Metrics**: Utilization, temperature, and memory usage.
- **Memory Metrics**: Total, used, and free memory.
- **Disk Metrics**: Total, used, and available disk space.
- **Network Metrics**: Received and transmitted data.

## References
- **GitHub Repository**: [AAST-Projects/Task_Manager](https://github.com/AAST-Projects/Task_Manager.git)
  - **Branches**:
    - `main`: Stable version
    - `dev`: Development branch
- **Docker Hub Image**: [mohamedeid123/task_manager](https://hub.docker.com/repository/docker/mohamedeid123/task_manager/tags)

## Contribution
Feel free to contribute by creating a pull request or raising an issue on the GitHub repository.

## License
This project is licensed under the MIT License. See the LICENSE file for details.


