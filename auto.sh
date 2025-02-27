#!/bin/bash

# File where the API key will be saved for future runs
API_KEY_FILE="api_key.txt"

# Check if the API key file exists
if [[ -f "$API_KEY_FILE" ]]; then
    # Display the currently saved API key (optional: you can choose not to show it)
    echo "A saved API key already exists."


    # Ask if user wants to reset (change) the API key
    read -p "Do you want to reset the API key? (y/n): " reset_choice
    if [[ "$reset_choice" =~ ^[Yy]$ ]]; then
        echo "Resetting the API key."
    else
        echo "Using saved API key from $API_KEY_FILE."
        exit 0
    fi
fi


# if api_key.txt doesn't exist, Prompt the user for the Telegram API key
read -p "Enter your Telegram API key: " API_KEY

# Confirm the entered API key
read -p "You entered '$API_KEY'. Are you sure? (y/N): " confirm_choice
if [[ "$confirm_choice" =~ ^[Yy]$ ]]; then
    # Save the API key to a file for future use
    echo "$API_KEY" > "$API_KEY_FILE"
    echo "API key saved to $API_KEY_FILE."
 else
    echo "API key not saved. Exiting."
    exit 1
fi

#append the key to a variable
 SAVED_KEY=$(cat "$API_KEY_FILE")

#Appending the zero-tier network address
$net_addr = network_address.txt
#checking for previously saved address
if [[ -f "$net_addr" ]]; then
    # Display the currently saved zero-tier address (optional: you can choose not to show it)
    echo "A saved zero-tier address already exists."

    # Ask if user wants to reset zero-tier address
    read -p "Do you want to reset the zero-tier address? (y/n): " reset_choice
    if [[ "$reset_choice" =~ ^[Yy]$ ]]; then
        echo "Resetting the zero-tier address."
    else
        echo "Using saved zero-tier address from $net_addr."
        exit 0
    fi
fi
# if network_address.txt doesn't exist, Prompt the user for the network address
read -p "Enter your Zero-Tier Network Address: " net_addr1

# Confirm the entered Address
read -p "You entered '$net_addr1'. Are you sure? (y/n): " confirm_choice
if [[ "$confirm_choice" =~ ^[Yy]$ ]]; then
    # Save the Address to a file for future use
    echo "$net_addr1" > "$net_addr"
    echo "Address saved to $net_addr."
 else
    echo "Address not saved..... Exiting."
    exit 1
fi

#append the key to a variable
 net=$(cat "$net_addr")


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
curl -s https://install.zerotier.com/ | bash

# Join ZeroTier network
echo "Joining ZeroTier network..."
sleep 2
zerotier-cli join "$net"

# Install Python dependencies
echo "Installing Python dependencies..."
sleep 2
apt-get install -y git python3-virtualenv libssl-dev libffi-dev build-essential libpython3-dev python3-minimal authbind virtualenv

# Add user 'cowrie' with a disabled password
echo "Adding user 'cowrie'..."
sleep 2
adduser --disabled-password --gecos "" cowrie

# Switch to user 'cowrie' and execute commands
echo "Switching to user 'cowrie'..."
sleep 2
su cowrie <<EOF
cd /home/cowrie

# Clone honeypot
echo "Cloning honeypot repository..."
sleep 2
git clone https://github.com/cowrie/cowrie.git

# Set up virtual environment
cd cowrie
echo "Setting up virtual environment..."
sleep 2
virtualenv cowrie-env
echo "Activating virtual environment..."
sleep 2
source cowrie-env/bin/activate

# Upgrade pip
echo "Upgrading pip..."
sleep 2
pip install --upgrade pip

# Install Cowrie requirements
echo "Installing Cowrie dependencies..."
sleep 2
pip install --upgrade -r requirements.txt

# Modify configuration file for Telegram API
cd etc
echo "Editing config file to append the API key..."
sleep 2
sed -i '/telegram[[:space:]]\+api/ s/\[[[:space:]]*\]/[$SAVED_KEY]/' cowrie.cfg.dist || { echo "Failed to update API key"; exit 1; }
echo "API key successfully appended!"
sleep 1

# Copy config file
cd ..
echo "Copying config file..."
sleep 2
cp etc/cowrie.cfg.dist cowrie.cfg

# Start Cowrie
echo "Starting Cowrie..."
sleep 2
bin/cowrie start

# Start live logs in the background
echo "Setting up live logs..."
sleep 2
tail -f ./var/log/cowrie/cowrie.log &

EOF

echo "Your honeypot environment has successfully started with live logs!"
