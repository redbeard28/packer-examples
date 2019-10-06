#!/bin/bash -eux
#############################################
#                                           #
#   playbook.sh Bash script           #
#                                           #
#   Made by redbeard28 <Jeremie CUADRADO>   #
#                                           #
#############################################
#                                           #
#   Version: 0.1                            #
#   Date: 06/10/2019                        #
#                                           #
#############################################




echo "127.0.0.1" > /home/debian/ansible_hosts
echo "
export ANSIBLE_INVENTORY=/home/debian/ansible_hosts
export ANSIBLE_CONFIG=/etc/ansible/ansible.cfg
export ANSIBLE_LOCAL_TEMP=/tmp/.ansible/tmp
" >> /home/debian/.bashrc
chown -R debian:debian /home/debian

source /home/debian/.bashrc

echo ""
echo "#####################"
ansible --version
echo "#####################"
echo""
#
echo "#####################"
echo "  CLONE REDBEARD28 REPO"
echo "#####################"

git clone https://github.com/redbeard28/packer-examples.git
#cp packer-examples/vsphere/debian-911/ansible/ansible.cfg /etc/ansible/
cd packer-examples/vsphere/debian-911/ansible/
chmod +x install_requirements.sh
echo "#####################"
echo "  ANSIBLE-GALAXY CMD"
echo "#####################"
./install_requirements.sh
echo "#####################"
echo "  ANSIBLE-PLAYBOOK"
echo "#####################"
ansible-playbook deploy_commons.yml -vvvv