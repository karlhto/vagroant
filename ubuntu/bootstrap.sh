#!/usr/bin/env sh

# Remove welcome message:
touch /root/.hushlogin
touch /home/vagrant/.hushlogin
chown vagrant:vagrant /home/vagrant/.hushlogin

# Enable X11 forwarding
sed -i 's/^#\(X11Forwarding[= ]\).*$/\1yes/g' /etc/ssh/sshd_config

# Script for personal setup, not mandatory
INIT_SCRIPT="/vagrant/ubuntu/custom_vm_init.sh"

if [ -f $INIT_SCRIPT ]; then
    bash "$INIT_SCRIPT"
    su -c "bash $INIT_SCRIPT" vagrant
fi
