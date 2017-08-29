#!/bin/bash

pushd $HOME

# staging server
apt-get -y install clamav clamav-daemon 

# virus scanning
freshclam
/etc/init.d/clamav-daemon start

# apache config
cp /vagrant/configs/apache.coppulpln.conf /etc/apache2/sites-available/coppulpln.conf
ln -s /etc/apache2/sites-available/coppulpln.conf /etc/apache2/sites-enabled/coppulpln.conf
service apache2 restart

# database
mysql -e "CREATE USER 'coppulpln'@'localhost'"
mysql -e "CREATE DATABASE coppulpln"
mysql -e "GRANT ALL ON coppulpln.* TO 'coppulpln'@'localhost'"
mysql -e "SET PASSWORD FOR coppulpln@localhost = PASSWORD('pln123')"

# app
git clone https://github.com/ubermichael/coppulpln.git
mv coppulpln /var/www/coppulpln
pushd /var/www/coppulpln
cp /vagrant/configs/coppulpln.yml app/config/parameters.yml
chown -R vagrant:vagrant .
setfacl -dR -m u:www-data:rwX -m u:ubuntu:rwX app/logs app/cache
setfacl -R -m u:www-data:rwX -m u:ubuntu:rwX app/logs app/cache
sudo -u vagrant COMPOSER_CACHE_DIR=/tmp/composer composer --no-progress install
./app/console doctrine:schema:create
./app/console fos:user:create --super-admin admin@example.com admin Admin example.com
mysql coppulpln < /vagrant/sql/coppulpln.sql
popd

popd
