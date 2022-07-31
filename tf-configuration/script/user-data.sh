#!/bin/bash

# Install Apache
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
cd /var/www/html
echo "<html><h1>Belong Coding Challenge</h1></html>" > belong-test.html 

# Install Docker
sudo apt-get -y install     apt-transport-https     ca-certificates     curl     gnupg-agent     software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository  -y  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker 
sudo docker version
sudo docker images
