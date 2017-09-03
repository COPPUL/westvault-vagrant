#!/bin/bash

pushd $HOME

# clearing out the old owncloud instance.
rm -rf /var/www/owncloud

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
sudo -u www-data php /var/www/owncloud/occ maintenance:install \
	--no-interaction \
	--database=mysql --database-name=owncloud \
	--database-user=owncloud --database-pass=occ123 \
	--admin-user=admin --admin-pass=admin

# git clone https://git.lib.sfu.ca/mjoyce/coppul-owncloud.git
# mv coppul-owncloud /var/www/owncloud/apps/coppulpln
# chown -R www-data:www-data /var/www/owncloud/apps/coppulpln
# pushd /var/www/owncloud/apps/coppulpln
# sudo -u www-data COMPOSER_CACHE_DIR=/tmp/composer composer --no-progress install
# popd
#   
# sudo -u www-data /var/www/owncloud/occ app:enable coppulpln 
# sudo -u www-data /var/www/owncloud/occ config:import /vagrant/configs/owncloud-pln.json 

popd
