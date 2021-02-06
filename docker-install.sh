#!/bin/bash

# Created by Mostafa Hassani
# Will install Docker in Centos

# Update
sudo yum update

# Remove old version of Docker
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine docker-ce

# Install yum-utils package to set up the repository
sudo yum install -y yum-utils

# Set up the stable repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install latest Docker Engine
sudo yum install docker-ce docker-ce-cli containerd.io

# Start Docker
sudo systemctl start docker

# Enable Docker
sudo systemctl enable docker

# Create a Docker user
sudo useradd docker

# Add the user docker to the Docker group
sudo usermod -aG docker docker

# Download Docker-Compose (update the release if needed)
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Set the permision of the binary file to executeble
sudo chmod +x /usr/local/bin/docker-compose
