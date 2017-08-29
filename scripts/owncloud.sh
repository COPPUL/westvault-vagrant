#!/bin/bash

pushd $HOME

apt-get install -y php5-gd php5-mcrypt php5-imagick libxml2-utils

cp /vagrant/configs/apache.owncloud.conf /etc/apache2/sites-available/owncloud.conf
ln -s /etc/apache2/sites-available/owncloud.conf /etc/apache2/sites-enabled/owncloud.conf
service apache2 restart
 
wget --quiet https://download.owncloud.org/community/owncloud-9.1.6.tar.bz2
tar -xjf owncloud-9.1.6.tar.bz2
mv owncloud /var/www/owncloud
chown -R vagrant:vagrant /var/www/owncloud
 
mysql -e "CREATE USER 'owncloud'@'localhost'"
mysql -e "CREATE DATABASE owncloud"
mysql -e "GRANT ALL ON owncloud.* TO 'owncloud'@'localhost'"
mysql -e "SET PASSWORD FOR owncloud@localhost = PASSWORD('occ123')"

sudo -u vagrant /var/www/owncloud/occ maintenance:install \
	--no-interaction \
	--database=mysql --database-name=owncloud \
	--database-user=owncloud --database-pass=occ123 \
	--admin-user=admin --admin-pass=admin

chown -R www-data:www-data /var/www/owncloud/data /var/www/owncloud/config
chmod 755 /var/www/owncloud/data /var/www/owncloud/config

git clone https://git.lib.sfu.ca/mjoyce/coppul-owncloud.git
mv coppul-owncloud /var/www/owncloud/apps/coppulpln
chown -R vagrant:vagrant /var/www/owncloud/apps/coppulpln
pushd /var/www/owncloud/apps/coppulpln
sudo -u vagrant COMPOSER_CACHE_DIR=/tmp/composer composer --no-progress install
popd
  
sudo -u www-data /var/www/owncloud/occ app:enable coppulpln 
sudo -u www-data /var/www/owncloud/occ config:import /vagrant/configs/owncloud-pln.json 

popd
