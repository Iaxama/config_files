#!/bin/bash

check_sudo(){
    if [[ $UID != 0 ]]; then
        echo "Please run this script with sudo:"
        echo "sudo $0 $*"
        exit 1
    fi
}

. bashrc

# BASHRC
if [ -f "$HOME/.bashrc" ]; then
    echo "Found pre-existing bashrc. Replacing it" 
    rm ~/.bashrc
fi
ln bashrc ~/.bashrc

if [ `is_installed docker-ce-cli` -eq "1" ]; then
    echo "Found Docker installation. Adding command line helpers"
    if [ -f "$HOME/.bashrc_docker" ]; then
        echo "Found pre-existing bashrc_docker. Replacing it" 
        rm ~/.bashrc_docker
    fi

    if [ -f "/etc/profile" ]; then
        echo "Found pre-existing profile file. Administrator privileges required to replace it" 
        check_sudo
        rm /etc/profile
    fi
    ln profile /etc/profile
    ln bashrc_docker ~/.bashrc_docker
fi

source ~/.bashrc

# SSH
if [ -d "$HOME/.ssh" ]; then
    echo "Found pre-existing .ssh/config. Replacing it"
    rm ~/.ssh/config
    ln ssh_config ~/.ssh/config
fi
