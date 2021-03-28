#!/bin/bash

if [ -z "$PS1" ]; then
	set -euo pipefail
	unalias -a
fi

# openssl passwd -crypt abc123
PW=GmZnvZfCpA1K6
useradd -m -p $PW -s /bin/bash mjoyce
echo '%mjoyce ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/mjoyce

for dir in /root /home/mjoyce /home/vagrant; do
	pushd $dir
		cp /vagrant/configs/user/bashrc $dir/.bashrc
		cp /vagrant/configs/user/my.cnf $dir/.my.cnf
	popd
done

chown -R mjoyce:mjoyce /home/mjoyce
chown -R vagrant:vagrant /home/vagrant

perl -pi -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
