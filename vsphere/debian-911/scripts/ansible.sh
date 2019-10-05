#!/bin/bash -eux
#############################################
#                                           #
#   ansible.sh Bash script           #
#                                           #
#   Made by redbeard28 <Jeremie CUADRADO>   #
#                                           #
#############################################
#                                           #
#   Version: 0.1                            #
#   Date: 20/08/2018                        #
#   UPDATE: 1.0 add github clone            #
#############################################

# From:
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-ubuntu
apt-get -y update && apt-get -y upgrade

# Install Ansible.
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt update
sudo apt install ansible -y

ansible --version

git clone https://github.com/redbeard28/packer-examples.git
cd packer-examples/vsphere/debian-911/ansible
chmod +x install_requirements.sh
ls -l
./install_requirements.sh
