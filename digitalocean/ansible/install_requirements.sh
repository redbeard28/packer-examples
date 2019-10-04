#!/bin/bash
#################################################################
#                                                               #
#	install.sh script - ansible-galaxy dependencies             #
#                                                               #
#	Author: Jeremie CUADRADO                                    #
#	Date: 01/01/2018	Version: v0.1                           #
#################################################################

ansible-galaxy install -r requirements.yml --roles-path ./roles --force
