#!/bin/bash

# Created by Mostafa Hassani
# Will install Docker in Centos

# Update
sudo yum update -y

# install Git
sudo yum install -y git

# Remove old version of Docker
sudo yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine docker-ce

# Install yum-utils package
sudo yum install -y yum-utils

# Set up the stable repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install latest Docker Engine
sudo yum install -y docker-ce docker-ce-cli containerd.io

# Start Docker
sudo systemctl start docker

# Enable Docker
sudo systemctl enable docker

# Create a Docker user and add it to the group Docker
sudo useradd docker -g docker

# uninstall Docker-compose
sudo rm /usr/local/bin/docker-compose

# Download Docker-Compose (update the release if needed)
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Set the permision of the binary file to executeble
sudo chmod +x /usr/local/bin/docker-compose
