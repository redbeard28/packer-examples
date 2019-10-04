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
echo "
# ubuntu user is default user in cloud-images.
# It needs passwordless sudo functionality.
ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-cloudimg-ubuntu
echo "includedir /etc/sudoers.d" >> /etc/sudoers
# From:
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-ubuntu
apt-get -y update && apt-get -y upgrade
apt-get -y install software-properties-common
apt-add-repository ppa:ansible/ansible

# Install Ansible.
apt-get -y update
apt-get -y install ansible

git clone https://github.com/redbeard28/packer-examples.git
cd packer-examples/digitalocean/ansible
chmod +x install_requirements.sh
ls -l
./install_requirements.sh
