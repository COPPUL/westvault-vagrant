#!/bin/bash

if [ -z "$PS1" ]; then
	set -euo pipefail
	unalias -a
fi

pushd $HOME

	yum install -y python3

	# configure apache
	cp /vagrant/configs/httpd/httpd.owncloud.conf /etc/httpd/conf.d/owncloud.conf
	rm -f /etc/httpd/conf.modules.d/00-dav.conf
	systemctl restart httpd

	# get the OC code
	curl -O https://attic.owncloud.org/community/owncloud-9.1.8.tar.bz2
	tar -xjf owncloud-9.1.8.tar.bz2
	mv owncloud /var/www/owncloud
	chown -R vagrant:vagrant /var/www/owncloud

	# set up a database
	mysql -e "CREATE USER owncloud@localhost"
	mysql -e "CREATE DATABASE owncloud"
	mysql -e "GRANT ALL ON owncloud.* TO owncloud@localhost"
	mysql -e "SET PASSWORD FOR owncloud@localhost = PASSWORD('occ123')"
	mysql -e "FLUSH PRIVILEGES"

	# install owncloud

	pushd /var/www/owncloud

		chmod a+x occ
		sudo -u vagrant ./occ maintenance:install \
			--no-interaction \
			--database=mysql --database-name=owncloud \
			--database-user=owncloud --database-pass=occ123 \
			--admin-user=admin --admin-pass=admin

		sudo -u vagrant ./occ config:system:set debug --value=true
		sudo -u vagrant ./occ config:system:set pln_site_url --value=http://localhost:8181/westvault/api/sword/2.0/sd-iri
		sudo -u vagrant ./occ config:system:set overwrite.cli.url --value=http://localhost:8181/owncloud

		# add the westvault app.
		git clone https://github.com/ubermichael/westvault.git apps/westvault
		chown -R vagrant:vagrant apps/westvault

		pushd apps/westvault
			sudo -u vagrant /usr/local/bin/composer --no-progress install
		popd
		sudo -u vagrant ./occ app:enable westvault

		sudo -u vagrant OC_PASS=corey   ./occ user:add --password-from-env --group=uvic corey
		sudo -u vagrant OC_PASS=mark    ./occ user:add --password-from-env --group=sfu mark
		sudo -u vagrant OC_PASS=michael ./occ user:add --password-from-env --group=sfu michael

		chown -R apache:apache config data
		setfacl -R -m u:apache:rwX -m u:vagrant:rwX config data
		setfacl -dR -m u:apache:rwX -m u:vagrant:rwX config data
	popd

popd
