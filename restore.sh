#!/bin/bash
# BASHRC
if [ -f "$HOME/.bashrc" ]; then
    echo "Found pre-existing bashrc. Removing it" 
    rm ~/.bashrc
fi
ln bashrc ~/.bashrc
source ~/.bashrc

# SSH
if [ -d "$HOME/.ssh" ]; then
    echo "Found pre-existing .ssh/config. Removing it"
    rm ~/.ssh/config
    ln ssh_config ~/.ssh/config
fi
