#!/bin/bash

# https://www.howtogeek.com/howto/ubuntu/install-samba-server-on-ubuntu/

apt-get install -y samba cifs-utils
cp /vagrant/configs/samba/smb.conf /etc/samba/smb.conf

(echo vagrant; echo vagrant) | smbpasswd -s -a vagrant
cp /vagrant/configs/samba/smbusers /etc/samba/smbusers
