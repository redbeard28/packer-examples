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
pip3 uninstall ansible

# Apt cleanup.
apt -y autoremove
apt -y update

rm -rf packer-examples
