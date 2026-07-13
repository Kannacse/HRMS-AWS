#!/bin/bash
set -e

LOG_FILE="/var/log/bootstrap.log"

exec > >(tee -a ${LOG_FILE}) 2>&1


echo "HRMS DevOps Bootstrap Started"
date


# Update system
sudo yum update -y

# Install required packages
sudo yum install -y \
    git \
    wget \
    curl \
    unzip \
    vim \
    jq \
    tree

# Install Docker
sudo amazon-linux-extras install docker -y

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker ec2-user

# Install Docker Compose
sudo mkdir -p /usr/local/lib/docker/cli-plugins

sudo curl -SL \
https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
-o /usr/local/lib/docker/cli-plugins/docker-compose

sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Install Java 17
sudo amazon-linux-extras enable corretto17

sudo yum install -y java-17-amazon-corretto

# Install AWS CLI
sudo yum install -y awscli

# Create project directories
sudo mkdir -p /opt/hrms
sudo mkdir -p /opt/docker
sudo mkdir -p /opt/scripts
sudo mkdir -p /opt/logs

sudo chown -R ec2-user:ec2-user /opt/hrms
sudo chown -R ec2-user:ec2-user /opt/docker
sudo chown -R ec2-user:ec2-user /opt/scripts
sudo chown -R ec2-user:ec2-user /opt/logs


echo "Bootstrap Completed Successfully"
date

