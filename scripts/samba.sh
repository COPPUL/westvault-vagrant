#!/bin/bash

# https://www.howtogeek.com/howto/ubuntu/install-samba-server-on-ubuntu/

apt-get install samba cifs-utils
cp /vagrant/configs/smb.conf /etc/samba/smb.conf

(echo vagrant; echo vagrant) | smbpasswd -s -a vagrant
cp /vagrant/configs/smbusers /etc/samba/smbusers
