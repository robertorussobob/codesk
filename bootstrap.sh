#!/usr/bin/env bash

# let git save credentials
git config --global credential.helper store

add-apt-repository ppa:deadsnakes/ppa -y
apt-get update

apt-get install -y \
python3.9-dev \
python3.9-distutils

update-alternatives --remove python /usr/bin/python2
update-alternatives --install /usr/bin/python python /usr/bin/python3 10
update-alternatives --install /usr/bin/python python /usr/bin/python3.9 11

apt-get install -y \
python3-pip \
awscli


python3 -m pip install --upgrade awscli
python3 -m pip install awscli-local[ver2]

apt-get install -y \
default-jre \
apt-transport-https \
ca-certificates \
curl \
gnupg \
lsb-release \
tmux \
ranger \
mc \
jq \
dos2unix \
pylint \
python3-dev \
libkrb5-dev \
nodejs \
npm \
parallel

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
groupadd docker
usermod -aG docker vagrant

# kubectl
apt-get install -y apt-transport-https ca-certificates curl
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install kubectl -y

# k3d
wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# mongosh
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
apt-get update
apt-get install -y mongodb-mongosh

python3 -m pip install --upgrade pip
python3 -m pip install \
Cython \
pyarrow \
dataclasses \
parquet-tools \
jsonschema \
csvkit \
flake8  \
fastapi \
colorlog \
ranger-fm

# ruby
snap install ruby --classic

# tmuxinator
sudo /usr/bin/env gem install tmuxinator
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.bash -O /etc/bash_completion.d/tmuxinator.bash

# install nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# install the latest release of node
nvm install --lts

# install Yarn
npm install --global yarn

# install Quasar CLI
yarn global add @quasar/cli

# install Icon Genie
yarn global add @quasar/icongenie

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Vundle
cat <<EOF >> ~/.vimrc
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'posva/vim-vue'
call vundle#end()
filetype plugin indent on
EOF

# CLI for Microdsoft 365
npm i -g @pnp/cli-microsoft365

# tmux configuration
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

apt update -y; apt upgrade -y
