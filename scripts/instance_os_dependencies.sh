#!/bin/bash

# Update packages
sudo yum update -y

# Install Python3 and pip
sudo yum install -y python3 python3-pip

# Install Nginx
sudo amazon-linux-extras enable nginx1
sudo yum clean metadata
sudo yum install -y nginx

# Install virtualenv
sudo pip3 install virtualenv