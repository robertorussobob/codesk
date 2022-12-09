#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get install software-properties-common -y

# Python 3.11
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y \
python3.11 \
python3.11-dev \
python3.11-distutils
sudo update-alternatives --remove python /usr/bin/python2
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 10
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.11 11
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 10
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 11
python --version
python3 --version

# pip
curl -sS https://bootstrap.pypa.io/get-pip.py | python
export PATH="$PATH:~/.local/bin"
pip --version

# AWS cli
sudo apt-get install -y unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf ./awscliv2.zip ./aws
aws --version

sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
default-jre \
dos2unix \
gnupg \
jq \
libkrb5-dev \
lsb-release \
mc \
parallel
pylint \
ranger \
tmux

# nvm and node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
nvm install --lts
node --versionnewgrp docker
npm --version

# Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
# logout login needed to docker without sudo

# tmux configuration
cd /home/vagrant/
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# let git save credentials
git config --global credential.helper store

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get autoremove -y

