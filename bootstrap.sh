#!/usr/bin/env bash

# Python repo
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install software-properties-common -y

sudo apt-get update -y
sudo update-alternatives --remove python /usr/bin/python2
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 10
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.11 11
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 10
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 11

# pip
curl -sS https://bootstrap.pypa.io/get-pip.py | python
export PATH="$PATH:~/.local/bin"

# AWS cli
sudo apt-get install -y unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install
rm -rf ./awscliv2.zip ./aws
aws --version

sudo apt-get install -y \
uidmap \
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

# Docker 22.04 Rootless mode
curl -fsSL https://get.docker.com -o get-docker.sh
sudo --user=vagrant sh ./get-docker.sh
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

