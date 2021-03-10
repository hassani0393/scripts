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


# The commands below will also open HTTP, HTTPS and SSH access in the system firewall.
sudo yum install -y curl policycoreutils-python openssh-server perl
sudo systemctl enable sshd
sudo systemctl start sshd
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo systemctl reload firewalld

#  install Postfix to send notification emails.
sudo yum install postfix
sudo systemctl enable postfix
sudo systemctl start postfix

# Add the GitLab package repository.
curl http://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash

# Next, install the GitLab package. Make sure you have correctly set up your DNS, and change https://gitlab.example.com to the URL at which you want to access your GitLab instance.
# Installation will automatically configure and start GitLab at that URL.
# For https:// URLs GitLab will automatically request a certificate with Let's Encrypt, which requires inbound HTTP access and a valid hostname. 
# You can also use your own certificate or just use http://.
sudo EXTERNAL_URL="http://gitlab.example.com" yum install -y gitlab-ce

# Installing Gitlab Runner

# Create the Docker volume
docker volume create gitlab-runner-config

# Start the Runner container using the volume we just created.
docker run -d --name gitlab-runner --restart always --env TZ="city"
-v /var/run/docker.sock:/var/run/docker.sock
-v gitlab-runner-config:/etc/gitlab-runner
gitlab/gitlab-runner:latest

# 
