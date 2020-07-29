#!/bin/bash

if [[ $UID == 0 ]]; then
    HOME=$(getent passwd $SUDO_USER | cut -d: -f6)
fi

. bashrc

# BASHRC
if [ -f "$HOME/.bashrc" ]; then
    echo "Found pre-existing bashrc. Replacing it" 
    rm $HOME/.bashrc
fi
ln bashrc $HOME/.bashrc

if [ `is_installed docker-ce-cli` -eq "1" ]; then
    echo "Found Docker installation. Adding command line helpers"
    if [ -f "$HOME/.bashrc_docker" ]; then
        echo "Found pre-existing bashrc_docker. Replacing it" 
        rm $HOME/.bashrc_docker
    fi
        ln bashrc_docker $HOME/.bashrc_docker

    if [[ $UID == 0 ]]; then
        
        if [ -f "/etc/profile" ]; then
            echo "Found pre-existing profile file"
            rm /etc/profile
        fi
            ln profile /etc/profile

    else
        echo "WARNING: Administrator privileges required to replace /etc/profile. Ignoring it."

    fi
fi

source $HOME/.bashrc

# SSH
if [ -d "$HOME/.ssh" ]; then
    echo "Found pre-existing .ssh/config. Replacing it"
    rm $HOME/.ssh/config
    ln ssh_config $HOME/.ssh/config
fi
