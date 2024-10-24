#!/bin/bash

# Update the system
sudo apt-get update

# Install Node.js and npm
sudo apt-get install -y nodejs npm

# Install React globally
sudo npm install -g create-react-app

# Verify installations
node -v
npm -v

