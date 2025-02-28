#remove the sleep commands if you think it's unnecessary
#i just added it for better debugging of the script

#!/bin/bash

# Update package list
echo "Updating package list..."
sleep 2
apt-get update -y

# Upgrade installed packages
echo "Upgrading packages..."
sleep 2
apt-get upgrade -y

# Install ZeroTier
echo "Installing ZeroTier..."
sleep 2
apt install curl -y
curl -s https://install.zerotier.com/ | bash

# Join ZeroTier network
echo "Joining ZeroTier network..."
sleep 2
zerotier-cli join  db64858fed998184

# test network connection
echo "displaying network config...."
sleep 2
apt install net-tools
ifconfig
# Install Python dependencies
echo "Installing Python dependencies..."
sleep 3
apt-get install -y git python3-virtualenv libssl-dev libffi-dev build-essential libpython3-dev python3-minimal authbind virtualenv

# Add user 'cowrie' with a disabled password
echo "Adding user 'cowrie'..."
sleep 2
adduser --disabled-password --gecos "" cowrie

# Switch to user 'cowrie' and execute commands
echo "Switching to user 'cowrie'..."
sleep 2
su cowrie 
