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

python3.5 -m pip install ansible


