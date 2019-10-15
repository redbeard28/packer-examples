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
#install_user=debian
# From:
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-ubuntu
apt-get -y update && apt-get -y upgrade
apt-get -y install python3-pip git



pip3 install ansible
#sed -i "s/\#includedir/includedir/g" /etc/sudoers
#echo "$install_user ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/dont-prompt-$install_user-for-password
#usermod -aG sudo $install_user
whoami
mkdir /etc/ansible
echo "127.0.0.1 ansible_connection=local" > /etc/ansible/hosts