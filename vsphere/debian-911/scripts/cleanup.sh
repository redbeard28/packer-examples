#!/bin/bash -eux
#############################################
#                                           #
#   clean.sh Bash script           #
#                                           #
#   Made by redbeard28 <Jeremie CUADRADO>   #
#                                           #
#############################################
#                                           #
#   Version: 0.1                            #
#   Date: 20/08/2018                        #
#                                           #
#############################################

# Uninstall Ansible and remove PPA.
python3 -m pip uninstall ansible -y

# Apt cleanup.
apt -y autoremove
apt -y update

rm -rf packer-examples
