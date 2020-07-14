sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common
sudo apt remove gpg
sudo apt update -y
sudo apt install -y gnupg1
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update -y
sudo apt install docker-ce -y
sudo groupadd docker
sudo usermod -a -G docker $USER
