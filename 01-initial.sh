#!/usr/bin/env bash

# to run this script, login as root first

# change this as you need before running the script
SUDO_USER=haqqi
SUDO_PASSWD=haqqi

# update package
apt-get update
apt-get install sudo -y

# setup new user
adduser $SUDO_USER
usermod -a -G sudo $SUDO_USER
su - $SUDO_USER

# permit root login
sudo sed -i "s/#\?PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config
sudo systemctl restart ssh