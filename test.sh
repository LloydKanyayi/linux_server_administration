#!/bin/bash

#update package manager 
yum update -y 

echo "Beginning Docker install"

# Install Docker-ce
yum install docker -y

# Start Docker

systemctl enable docker

systemctl start docker

echo "Docker successfully installed"
echo "Beginning post installation steps"

# Post Installation Steps

# Create Docker group
groupadd docker

# Add user to the docker group
usermod -aG docker $USER

echo "Creating RunDeck service"

# create runddeck, jenkins and prometheus containers
docker run -d --name some-rundeck -p 4440:4440 -v data:/home/rundeck/server/data rundeck/rundeck:3.3.7

echo "Creating Jenkins service"

docker run -d -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts

echo "Creating Prometheus service"

docker run -d -p 9090:9090 prom/prometheus



