#!/bin/bash

if [ -z "$PS1" ]; then
	set -euo pipefail
	unalias -a
fi

pushd $HOME

	# # staging server
	yum -y install clamav clamav-server clamav-update clamav-server-systemd
	#
	# # virus scanning
	# freshclam --quiet
	# systemctl enable clamd@scan
	#
	# pushd /etc/clam.d
	# clamconf -g clamd.d/scan.conf > clamd.conf
	# sed -i -e 's/Example//' clamd.conf
	# sed -i -e 's/Example//' scan.conf
	# ln -s clamd.conf /etc/clamd.conf
	# popd

	# apache config
	cp -f /vagrant/configs/httpd/httpd.westvault.conf /etc/httpd/conf.d/westvault.conf
	systemctl restart httpd

	# database
	mysql -e "CREATE USER westvault@localhost"
	mysql -e "CREATE DATABASE westvault"
	mysql -e "GRANT ALL ON westvault.* TO westvault@localhost"
	mysql -e "SET PASSWORD FOR westvault@localhost = PASSWORD('pln123')"

	# app
	git clone https://github.com/ubermichael/westvault-pln.git westvault
	mv westvault /var/www/westvault
	pushd /var/www/westvault
		chmod a+x app/console
		cp /vagrant/configs/westvault.yml app/config/parameters.yml
		chown -R vagrant:vagrant .

		setfacl -R -m u:apache:rwX -m u:vagrant:rwX app/{cache,logs}
    setfacl -dR -m u:apache:rwX -m u:vagrant:rwX app/{cache,logs}

		sudo -u vagrant /usr/local/bin/composer install
		php app/console doctrine:schema:create
		php app/console fos:user:create --super-admin admin@example.com admin Admin example.com
		php app/console fos:user:promote admin@example.com ROLE_ADMIN
		mysql westvault < /vagrant/sql/westvault.sql
		chown -R vagrant:vagrant .
	popd
popd
