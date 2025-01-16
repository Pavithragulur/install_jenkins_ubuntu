#!/bin/bash

echo "This may take sometime. Please wait..."
# Download Jenkins keyring
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian/jenkins.io-2023.key &> /dev/null

# Add Jenkins repository to sources.list
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package information
sudo apt-get update -y  &> /dev/null

# Install fontconfig and OpenJDK 17 JRE
sudo apt-get install fontconfig openjdk-17-jre -y  &> /dev/null

# Install Jenkins
sudo apt-get install jenkins -y  &> /dev/null

# Check Jenkins service status
systemctl status jenkins
