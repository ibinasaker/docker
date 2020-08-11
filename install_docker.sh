#!/bin/sh

## this script to automate docker install on Ubuntu/Debian linux distributions
sudo apt update -y && sudo apt autoremove -y && sudo apt autoclean -y

# install pre-required packages
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    curl \
    software-properties-common

# add docker key for the approperiate distribution
dist_name=$(cat /etc/issue | grep -Eo '^[^ ]+' | tr '[:upper:]' '[:lower:]')
curl -fsSL https://download.docker.com/linux/$dist_name/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# install docker-ce for the approperiate distribution
dist_name=$(cat /etc/issue | grep -Eo '^[^ ]+' | tr '[:upper:]' '[:lower:]')
sudo add-apt-repository -y  \
    "deb [arch=amd64] https://download.docker.com/linux/$dist_name $(lsb_release -cs) stable"
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io

# add user to docker group to avoid needing for sudo when typing docker commands
sudo groupadd docker
sudo usermod -a -G docker $USER

# Install Python 3 and PIP.
sudo apt-get install -y python3 python3-pip

# Install Docker Compose into your user's home directory.
pip3 install --user docker-compose

# starting docker service
sudo service docker start

LBLUE='\033[1;34m'
NC='\033[0;35m'
printf "${LBLUE}To test run ${NC}docker run hello-world\n"
printf "${LBLUE}if you get docker deamon error try running ${NC}sudo service docker start \n"
printf "${LBLUE}if you face permission issues try to re-login!\n"
