#!/bin/bash

pushd $HOME

apt-get install -y php-gd php-mcrypt php-imagick

a2enmod rewrite headers env dir mime
cp configs/apache.owncloud.conf /etc/apache2/sites-available/owncloud.conf
ln -s /etc/apache2/sites-available/owncloud.conf /etc/apache2/sites-enabled/owncloud.conf
service apache2 restart

wget https://download.owncloud.org/community/owncloud-10.0.2.tar.bz2
tar -xjf owncloud-10.0.2.tar.bz2
mv owncloud /var/www/owncloud
chown -R www-data:www-data /var/www/owncloud

mysql -e "CREATE USER 'owncloud'@'localhost'"
mysql -e "CREATE DATABASE owncloud"
mysql -e "GRANT ALL ON owncloud.* TO 'owncloud'@'localhost'"
mysql -e "SET PASSWORD FOR owncloud@localhost = PASSWORD('occ123')"
 
sudo -u www-data /var/www/owncloud/occ maintenance:install \
	--database mysql --database-name owncloud \
	--database-user owncloud --database-pass occ123
	--admin-user admin --admin-pass admin

git clone https://git.lib.sfu.ca/mjoyce/coppul-owncloud.git
mv coppul-owncloud /var/www/owncloud/apps/coppulpln
pushd /var/www/owncloud/apps/coppulpln
composer install
popd

sudo -u www-data /var/www/owncloud/occ app:enable coppulpln

popd
