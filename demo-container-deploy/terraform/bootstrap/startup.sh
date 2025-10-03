#!/bin/bash
# -----------------------------------------------------------------------------
# startup.sh
# Bootstrap script for EC2 instance
# - Installs Docker and required dependencies
# - Configures Docker daemon
# - Creates a Docker bridge network
# - Runs a sample Flask app container
# -----------------------------------------------------------------------------

set -e  # Exit immediately if a command fails

# Install dependencies and Docker
dnf -y install dnf-plugins-core git
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io

# Configure Docker daemon
mkdir -p /etc/docker
cat <<CONFIG > /etc/docker/daemon.json
{
    "iptables": false
}
CONFIG

# Enable and start Docker
systemctl enable --now docker

# Create a Docker bridge network
docker network create --driver bridge --label com.docker.compose.network=devops-playground devops-playground

# Run the Flask app container
docker run -d -p 8080:5000 --network devops-playground --name flask-app feropstech/flask-app:latest