#!/bin/bash
#############################################
#                                           #
#   install_packer.sh Bash script           #
#                                           #
#   Made by redbeard28 <Jeremie CUADRADO>   #
#                                           #
#############################################
#                                           #
#   Version: 0.1                            #
#   Date: 20/08/2018                        #
#                                           #
#############################################

#Get actual packer version
temp_version=`curl -X GET "https://releases.hashicorp.com/packer/" |grep "<a href=" | sed "s/<a href/\\n<a href/g" | sed 's/\"/\"><\/a>\n/2'|grep packer_| sort |uniq|tail -n1|sed "s/>//g"|sed "s/<\/a//g"`
short_version=`echo $temp_version | awk -F "_" '{ print $2 }'`
packer_version=`echo $temp_version |awk -F '"n' '{ print $2 }'`
bin_unzip=`which unzip`


# Testing if symlink already exist !
if [ -L /usr/bin/packer ];then
    sudo unlink /usr/bin/packer
fi

# Get pre-compiled binary from packer repo
wget https://releases.hashicorp.com/packer/${short_version}/${packer_version}_linux_amd64.zip
#wget https://releases.hashicorp.com/packer/1.3.1/packer_1.3.1_linux_amd64.zip

# Check if unzip is installed
if [ ! -f $bin_unzip ];then
    sudo apt install unzip -y
fi

sudo bin_unzip ${packer_version}_linux_amd64.zip -d /opt/${packer_version}
sudo ln -s /opt/${packer_version}/packer /usr/bin/packer

# END
