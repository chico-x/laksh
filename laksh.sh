#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update -y

# Upgrade installed packages
echo "Upgrading packages..."
sudo apt upgrade -y
