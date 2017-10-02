#!/bin/bash

pushd $HOME

	# apache config
	cp /vagrant/configs/apache.lockssomatic.conf /etc/apache2/sites-available/lockssomatic.conf
	ln -s /etc/apache2/sites-available/lockssomatic.conf /etc/apache2/sites-enabled/lockssomatic.conf
	service apache2 restart

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
		
		setfacl -R -m u:www-data:rwX -m u:vagrant:rwX app/{cache,logs}
        setfacl -dR -m u:www-data:rwX -m u:vagrant:rwX app/{cache,logs}
            
		/usr/local/bin/composer --no-progress install
		./app/console doctrine:schema:create
		./app/console fos:user:create --super-admin admin@example.com admin Admin example.com
		./app/console cache:clear		
		chown -R vagrant:vagrant .
	popd

popd
