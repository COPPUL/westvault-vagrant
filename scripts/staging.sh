#!/bin/bash

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
	cp /vagrant/configs/httpd/httpd.westvaultpln.conf /etc/httpd/conf.d/westvaultpln.conf
	systemctl restart httpd

	# database
	mysql -e "CREATE USER 'westvaultpln'@'localhost'"
	mysql -e "CREATE DATABASE westvaultpln"
	mysql -e "GRANT ALL ON westvaultpln.* TO 'westvaultpln'@'localhost'"
	mysql -e "SET PASSWORD FOR westvaultpln@localhost = PASSWORD('pln123')"

	# app
	git clone https://github.com/ubermichael/westvault-pln.git westvaultpln
	mv westvaultpln /var/www/westvaultpln
	pushd /var/www/westvaultpln
		chmod a+x app/console
		cp /vagrant/configs/westvaultpln.yml app/config/parameters.yml
		chown -R vagrant:vagrant .

		setfacl -R -m u:apache:rwX -m u:vagrant:rwX app/{cache,logs}
    setfacl -dR -m u:apache:rwX -m u:vagrant:rwX app/{cache,logs}

		sudo -u vagrant /usr/local/bin/composer --no-progress install
		php app/console doctrine:schema:create
		php app/console fos:user:create --super-admin admin@example.com admin Admin example.com
		php app/console fos:user:promote admin@example.com ROLE_ADMIN
		mysql westvaultpln < /vagrant/sql/westvaultpln.sql
		chown -R vagrant:vagrant .
	popd

popd
