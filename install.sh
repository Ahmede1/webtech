#!/bin/bash
error_exit() {
    echo "Error: $1" >&2
    exit 1
}

sudo apt -y update || error_exit "Failed to update packages"
sudo apt -y upgrade || error_exit "Failed to upgrade packages"
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt -y update
sudo apt install -y python3.9 python3.9-venv
python3.9 -m venv . || error_exit "Failed to create virtual environment"
source ./bin/activate || error_exit "Failed to activate virtual environment"
git clone https://github.com/Ahmede1/webtech.git || error_exit "Failed to clone the repository"
cd webtech/wappalyzer/
pip3.9 install .
pip3.9 install colorama
sudo cp techget /usr/local/bin/ || error_exit "Failed to copy techget script"
sudo chmod +x /usr/local/bin/techget || error_exit "Failed to make techget executable"
echo "Script completed successfully."
echo "Please run techget -h :) " 
cd ~
exec bash
