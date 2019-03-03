#!/bin/bash

yum install -y samba cifs-utils
cp -f /vagrant/configs/samba/smb.conf /etc/samba/smb.conf

(echo vagrant; echo vagrant) | smbpasswd -s -a vagrant
cp /vagrant/configs/samba/smbusers /etc/samba/smbusers

setsebool -P samba_enable_home_dirs on

systemctl enable smb.service
systemctl enable nmb.service
systemctl restart smb.service
systemctl restart nmb.service
