#!/bin/bash

pushd $HOME

	apt-get install -y php5-gd php5-mcrypt php5-imagick libxml2-utils python3 python3-pip

	# OC Dev tool
	git clone https://github.com/owncloudarchive/ocdev.git
	pushd ocdev
		make -q install
	popd

	# configure apache
	cp /vagrant/configs/apache.owncloud.conf /etc/apache2/sites-available/owncloud.conf
	ln -s /etc/apache2/sites-available/owncloud.conf /etc/apache2/sites-enabled/owncloud.conf
	service apache2 restart

	# get the OC code 
	wget --quiet https://download.owncloud.org/community/owncloud-9.1.6.tar.bz2
	tar -xjf owncloud-9.1.6.tar.bz2
	mv owncloud /var/www/owncloud
	chown -R www-data:www-data /var/www/owncloud

	# set up a database
	mysql -e "CREATE USER 'owncloud'@'localhost'"
	mysql -e "CREATE DATABASE owncloud"
	mysql -e "GRANT ALL ON owncloud.* TO 'owncloud'@'localhost'"
	mysql -e "SET PASSWORD FOR owncloud@localhost = PASSWORD('occ123')"
	mysql -e "FLUSH PRIVILEGES"

	# install owncloud
	
	pushd /var/www/owncloud
		chmod u+x occ
		sudo ./occ maintenance:install \
			--no-interaction \
			--database=mysql --database-name=owncloud \
			--database-user=owncloud --database-pass=occ123 \
			--admin-user=admin --admin-pass=admin

		./occ config:system:set debug --value=true
		./occ config:system:set pln_site_url --value=http://localhost:8181/westvaultpln/web/app_dev.php/api/sword/2.0/sd-iri
	
		# add the westvault app.
		git clone https://github.com/ubermichael/westvault.git apps/westvault
		
		chown -R vagrant:vagrant /var/www/owncloud
		chown -R www-data:www-data /var/www/owncloud/config
		chown -R www-data:www-data /var/www/owncloud/data
		setfacl -R -m u:www-data:rwX -m u:vagrant:rwX config data
		setfacl -dR -m u:www-data:rwX -m u:vagrant:rwX config data

		pushd apps/westvault
			composer --no-progress install
		popd
		occ app:enable westvault 
	
		# add some users.	
		sudo -u www-data OC_PASS=corey php /var/www/owncloud/occ user:add --password-from-env --group=uvic corey
		sudo -u www-data OC_PASS=mark php /var/www/owncloud/occ user:add --password-from-env --group=sfu mark
		sudo -u www-data OC_PASS=janice php /var/www/owncloud/occ user:add --password-from-env --group=sfu janice
	popd

popd
