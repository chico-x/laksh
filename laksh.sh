#!/bin/bash

# Update package list'
echo "Updating package list..."
sleep 2
apt update -y

# Upgrade installed packages
echo "Upgrading packages..."
sleep 2
apt upgrade -y

# install zerotier
echo "installing zerotier...."
sleep 2
curl -s https://install.zerotier.com/ | bash

#join zerotier network
echo "Joining zerotier network...."
sleep 2
zerotier-cli join 565799d8f6bca37c

# install python dependencies
echo "installing python dependencies...."
sleep 2
apt-get install git python3-virtualenv libssl-dev libffi-dev build-essential libpython3-dev python3-minimal authbind virtualenv

# Add user 'cowrie' with disabled password
echo "adding user with disabled password...."
sleep 2
adduser --disabled-password --gecos "" cowrie

# Switch to user 'cowrie'
echo "switching user to cowrie..."
sleep 2
su - cowrie

# change directory
echo "changing user directory..."
sleep 2
cd ..
echo "changing user directory to home...."
sleep 2
cd home
echo "changing directory to  user cowrie...."
sleep 2
cd cowrie

# clone into honeypot
echo "cloning into honeypot...."
sleep 2
git clone https://github.com/cowrie/cowrie.git

# setup virtual enviornment using python for pip usage
echo "setting up virtual enviornment for cowrie..."
sleep 2
virtualenv cowrie-env
echo "Activating virtual enviornment..."
sleep 2
source cowrie-env/bin/activate

# setting up pip
echo "upgrading pip...."
sleep 2
pip install --upgrade pip

#change directory before installing cowrie requirements
echo "changing directory...."
sleep 2
Cd cowrie
echo "installing cowrie requirements...."
sleep 2
pip install --upgrade -r requirements.txt

# change directory to bin and modify the configuration file to provide the telegram api
echo "changing directory to etc..."
sleep 2
Cd etc
echo "using sed to edit config file to append the api key.."
sleep 2
sed -i '/telegram[[:space:]]\+api/ s/\[[[:space:]]*\]/[my_api_key_laksh]/' cowrie.cfg.dist || { echo "Failed to update API key"; exit 1; }
echo "api key sucessfully appended!!"
sleep 1
echo "changing directory..."
sleep 2
cd ..
echo "copying files..."
sleep 2
cp etc/cowrie.cfg.dist cowrie.cfg
echo "starting cowrie..." 
sleep 2
bin/cowrie start

# setup live logs
echo "setting up live logs using tail..."
sleep 2
tail -f ./var/log/cowrie/cowrie.log
sleep 3
echo "Your honeypot enviornment has sucessfully started with live logs!!!"


