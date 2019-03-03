#!/bin/bash

pushd $HOME

	# apache config
	cp /vagrant/configs/httpd/httpd.lockssomatic.conf /etc/apache2/conf.d/lockssomatic.conf
	systemctl restart httpd

	# database
	mysql -e "CREATE USER 'lockssomatic'@'localhost'"
	mysql -e "CREATE DATABASE lockssomatic"
	mysql -e "GRANT ALL ON lockssomatic.* TO 'lockssomatic'@'localhost'"
	mysql -e "SET PASSWORD FOR lockssomatic@localhost = PASSWORD('lom123')"

	# app
	git clone https://github.com/ubermichael/lockss-o-matic.git lockssomatic
	mv lockssomatic /var/www/lockssomatic
	pushd /var/www/lockssomatic
		chmod a+x app/console
		cp /vagrant/configs/lockssomatic.yml app/config/parameters.yml
		chown -R vagrant:vagrant .

		mkdir data
		setfacl -R -m u:apache:rwX -m u:vagrant:rwX app/{cache,logs} data
    setfacl -dR -m u:apache:rwX -m u:vagrant:rwX app/{cache,logs} data

		sudo -u vagrant /usr/local/bin/composer --no-progress install
		./app/console doctrine:schema:create
		./app/console fos:user:create --super-admin admin@example.com admin Admin example.com
		./app/console fos:user:promote admin@example.com ROLE_ADMIN
		./app/console cache:clear

		./app/console lom:import:plugin /vagrant/lockss/WestVaultPlugin.jar

		chown -R vagrant:vagrant .
	popd

popd
