# script to automate docker install on Ubuntu/Debian 
sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
sudo apt remove gpg
sudo apt update -y
sudo apt install -y gnupg1
dist_name=$(cat /etc/issue | grep -Eo '^[^ ]+' | tr '[:upper:]' '[:lower:]')
curl -fsSL https://download.docker.com/linux/$dist_name/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository -y  "deb [arch=amd64] https://download.docker.com/linux/$dist_name \
   $(lsb_release -cs) \
   stable"
sudo apt update -y
sudo apt install -y docker-ce 
sudo groupadd docker
sudo usermod -a -G docker $USER
