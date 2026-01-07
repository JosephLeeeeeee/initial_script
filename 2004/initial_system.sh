#!/usr/bing/env bash

# Print initializing message
echo -e "\n\033[33mHi! System is initilizing, please wait :)\033[0m\n"
sleep 1

# Update and upgrade apt
sudo apt-get update -yq
sudo apt-get upgrade -yq
echo -e "\n\033[33mSystem update completed\033[0m\n"

# apt-get install Git, git-lfs, tmux, nload, iproute2, lsof
sudo apt-get install -yq git git-lfs tmux nload iproute2 lsof
echo -e "\n\033[33mBasic installation completed\033[0m\n"

# pip install/upgrade pip, gpustat, modelscope, rclone
pip install --upgrade pip
pip install --upgrade gpustat
pip install modelscope
pip install rclone
echo -e "\n\033[33mPip installing completed\033[0m\n"

# Get rclone ready
mkdir -p ~/.config/rclone
cp ./rclone.conf ~/.config/rclone/

# Install VPN client
source ./vpn/initial_vpn.sh
echo -e "\n\033[33mVPN client installed\033[0m\n"

# Install Claude Code
sudo apt remove nodejs npm -y
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g @anthropic-ai/claude-code
echo -e "\n\033[33mClaude Code installed\033[0m\n"

# Install Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
conda activate
rm Miniconda3-latest-Linux-x86_64.sh
echo -e "\n\033[33mMiniconda installed\033[0m\n"

# Copy bashrc and source
cp bashrc ~/.bashrc
source ~/.bashrc

# Print compelete message
echo -e "\n\033[33mSystem is ready to use. Carry on!\033[0m\n"
