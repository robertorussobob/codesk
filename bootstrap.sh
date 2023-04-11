#!/usr/bin/env bash

# Python repo
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install software-properties-common -y

sudo apt-get update -y
#sudo apt-get install -y \
#python3.11 \
#python3.11-dev \
#python3.11-distutils
sudo update-alternatives --remove python /usr/bin/python2
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 10
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.11 11
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 10
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
tmux \
uidmap

# Docker
## sudo apt-get remove docker docker-engine docker.io containerd runc
## sudo mkdir -p /etc/apt/keyrings
## curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /etc/apt/keyrings/docker.gpg
## echo \
      ## "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        ## $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
## sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
## sudo docker run hello-world
## sudo groupadd docker
## sudo usermod -aG docker $USER
## logout login needed to docker without sudo

# Docker 22.04 Rootless mode
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
dockerd-rootless-setuptool.sh install
export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# tmux configuration
cd /home/vagrant/
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# let git save credentials
git config --global credential.helper store

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get autoremove -y

## nvm and node
#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
#export NVM_DIR="/home/vagrant/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#nvm install --lts
#node --versionnewgrp docker
#npm --version

## # gcloud CLI
## echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
## curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
## sudo apt-get update && sudo apt-get install google-cloud-cli
