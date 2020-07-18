## this script to automate docker install on Ubuntu/Debian linux distributions
sudo apt update -y && sudo apt autoremove -y && sudo apt autoclean -y

# install pre-required packages
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# reinstall gpg in case the if the packages is broken (sometimes ubuntu shipped with broken gpg)
sudo apt remove -y gpg
sudo apt update -y
sudo apt install -y gnupg1

# add docker key for the approperiate distribution  
dist_name=$(cat /etc/issue | grep -Eo '^[^ ]+' | tr '[:upper:]' '[:lower:]')
curl -fsSL https://download.docker.com/linux/$dist_name/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# install docker-ce for the approperiate distribution
sudo add-apt-repository -y  "deb [arch=amd64] https://download.docker.com/linux/$dist_name \
   $(lsb_release -cs) \
   stable"
sudo apt update -y
sudo apt install -y docker-ce 

# add user to docker group to avoid needing for sudo when typing docker commands
sudo groupadd docker
sudo usermod -a -G docker $USER

# Install Python 3 and PIP.
sudo apt-get install -y python3 python3-pip

# Install Docker Compose into your user's home directory.
pip3 install --user docker-compose

RED='\033[0;31m'
printf "${RED}Please sign out and re-login in order to run Docker!\n"
