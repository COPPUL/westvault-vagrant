#!/bin/bash

# openssl passwd -crypt abc123
PW=GmZnvZfCpA1K6
useradd -m -p $PW -s /bin/bash mjoyce
echo '%mjoyce ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/mjoyce

for user in /root /home/vagrant /home/mjoyce; do
	pushd $user
		git clone https://github.com/ubermichael/dot-files.git
			pushd dot-files
				./install.sh
			popd

		git clone https://github.com/ubermichael/dot-emacs.git
		pushd dot-emacs
			make
		popd

		cp -f /vagrant/configs/mysql/my.cnf /root/.my.cnf
	popd
done

chown -R mjoyce:mjoyce /home/mjoyce
chown -R vagrant:vagrant /home/vagrant

perl -pi -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
