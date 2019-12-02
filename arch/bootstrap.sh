#!/usr/bin/env sh

# Remove welcome message:
touch /root/.hushlogin
touch /home/vagrant/.hushlogin
chown vagrant:vagrant /home/vagrant/.hushlogin

# Enable X11 forwarding
sed -i 's/^#\(X11Forwarding[= ]\).*$/\1yes/g' /etc/ssh/sshd_config
echo "StreamLocalBindUnlink=yes" >> /etc/ssh/sshd_config

# C-things
sudo pacman -S --noconfirm gcc clang
sudo pacman -S --noconfirm valgrind gdb

# Necessary things for dev environments
sudo pacman -S --noconfirm git

# ZSH! A better alternative to bash
sudo pacman -S --noconfirm zsh

# Shared folders
sudo pacman -S --noconfirm nfs-utils

chsh -s /bin/zsh vagrant

# Script for personal setup, not mandatory
INIT_SCRIPT="/vagrant/arch/custom_vm_init.sh"

if [ -f $INIT_SCRIPT ]; then
    bash "$INIT_SCRIPT"
    su -c "bash $INIT_SCRIPT" vagrant
fi
