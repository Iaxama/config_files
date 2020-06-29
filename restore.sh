#!/bin/bash

. bashrc

# BASHRC
if [ -f "$HOME/.bashrc" ]; then
    echo "Found pre-existing bashrc. Removing it" 
    rm ~/.bashrc
fi
ln bashrc ~/.bashrc

if [ `is_installed docker-ce-cli` -eq "1" ]; then
	if [ -f "$HOME/.bashrc_docker" ]; then
	    echo "Found pre-existing bashrc_docker. Removing it" 
	    rm ~/.bashrc_docker
    fi
    ln bashrc_docker ~/.bashrc_docker
fi

source ~/.bashrc

# SSH
if [ -d "$HOME/.ssh" ]; then
    echo "Found pre-existing .ssh/config. Removing it"
    rm ~/.ssh/config
    ln ssh_config ~/.ssh/config
fi
