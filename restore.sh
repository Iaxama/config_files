#!/bin/bash
# BASHRC
if [ -f "~/.bashrc" ]; then
   echo "Found pre-existing bashrc. Removing it" 
   rm ~/.bashrc
fi
ln bashrc ~/.bashrc
source ~/.bashrc

# SSH
if [ -d "~/.ssh" ]; then
   rm ~/.ssh/config
   ln ssh_config ~/.ssh/config
fi
