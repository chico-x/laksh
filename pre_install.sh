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
ifconfig
