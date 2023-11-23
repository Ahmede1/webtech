# webtech

sudo apt -y update || error_exit "Failed to update packages"
sudo apt -y upgrade || error_exit "Failed to upgrade packages"
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt -y update
sudo apt install -y python3.9 python3.9-venv
python3.9 -m venv . 
source ./bin/activate 
git clone https://github.com/Ahmede1/webtech.git 
cd webtech/wappalyzer/
pip3.9 install .
pip3.9 install colorama
sudo cp techget /usr/local/bin/
sudo chmod +x /usr/local/bin/techget 
cd ~
exec bash
