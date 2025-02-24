#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update -y

# Upgrade installed packages
echo "Upgrading packages..."
sudo apt upgrade -y

# install zerotier
echo "installing zerotier...."
curl -s https://install.zerotier.com/ | bash

#join zerotier network
echo "Joining zerotier network...."
zerotier-cli join 565799d8f6bca37c

# install python dependencies
echo "installing python dependencies...."
apt-get install git python3-virtualenv libssl-dev libffi-dev build-essential libpython3-dev python3-minimal authbind virtualenv

# Add user 'cowrie' with disabled password
adduser --disabled-password --gecos "" cowrie

# Switch to user 'cowrie'
su - cowrie

