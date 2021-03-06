#!/bin/bash -eux
job_name=`basename "$0"`
source ${HOME}/debian-911.env
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
sudo python3 -m pip uninstall ansible -y

# Apt cleanup.
sudo apt-get -y autoremove
sudo apt-get -y update

rm -rf ${PATH_LOCAL_REPO}
rm -rf *.sh
rm -rf *.env