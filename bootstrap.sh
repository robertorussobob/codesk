#p2!/usr/bin/env bash

APT_OPT="-q=2"

export PATH="$HOME/.local/bin:$PATH"

# Python repo
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update $APT_OPT && sudo apt-get upgrade $APT_OPT
sudo apt-get install software-properties-common $APT_OPT

sudo apt-get update $APT_OPT

sudo apt-get install $APT_OPT \
python3.9 \
python3.9-dev \
python3.9-distutils

sudo update-alternatives --remove python /usr/bin/python2
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 10
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 10
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 11
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 11

# pip
curl -sS https://bootstrap.pypa.io/get-pip.py | python
#export PATH="$PATH:~/.local/bin"

# AWS cli
sudo apt-get install $APT_OPT unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install
rm -rf ./awscliv2.zip ./aws
aws --version

# AWS SAM cli
curl -OL https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip -q aws-sam-cli-linux-x86_64.zip -d sam-installation
rm aws-sam-cli-linux-x86_64.zip
sudo ./sam-installation/install
rm -rf sam-installation
sam --version

sudo apt-get install $APT_OPT \
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

# run docker as non-root user
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

#dockerd-rootless-setuptool.sh install
#export DOCKER_HOST=unix:///run/user/1000/docker.sock
#cat >> ~/.profile <<EOF
#export DOCKER_HOST=unix:///run/user/1000/docker.sock
#EOF

# kubectl
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# tmux configuration
cd /home/vagrant/
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# let git save credentials
git config --global credential.helper store

sudo apt-get update -q=2 && sudo apt-get upgrade -q=2
sudo apt-get autoremove -q=2

cat >> ~/.profile <<EOF
set -o vi
EOF

python -m pip install \
awscli-local \
aws-sam-cli-local \
csvkit \
black \
flake8 \
parquet-tools \
ranger-fm

# nvm, npm, yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install --lts
npm install --global yarn

# quasar
yarn global add @quasar/cli
yarn global add @quasar/icongenie

# Terraform
sudo apt-get update -y && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y
sudo apt-get install -y terraform

sudo lvextend /dev/ubuntu-vg/ubuntu-lv -L+31G -r
