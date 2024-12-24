# Use an official Ubuntu base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Install necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    bash \
    zenity \
    lsb-release \
    software-properties-common \
    lm-sensors \
    iftop \
    net-tools \
    gawk \
    curl \
    wget \
    git \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies for graphs.py
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt && rm /tmp/requirements.txt

# Create the application directory
WORKDIR /app

# Copy the project files
COPY . .

# Make shell scripts executable
RUN chmod +x *.sh */*.sh

# Expose a default port if needed (e.g., if running a web server)
EXPOSE 8000

# Default command to run the application
CMD ["bash", "main.sh"]

