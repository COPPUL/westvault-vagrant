#!/bin/bash

# mysql is a PITA. 
export DEBIAN_FRONTEND="noninteractive"
apt-get -y install debconf-utils
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get -y install mysql-client mysql-server 

cp /vagrant/configs/mysql.server.cnf /etc/mysql/my.cnf

mysql --defaults-file=/vagrant/configs/my.cnf -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';"
mysql --defaults-file=/vagrant/configs/my.cnf -e "FLUSH PRIVILEGES;"

service mysql restart

# LAMP
apt-get -y install apache2 php5 php5-dev php5-xsl php5-curl php5-cli php5-intl php5-json \
	php5-mysql libapache2-mod-php5 php-pear
pear install Archive_Tar
a2enmod rewrite headers env dir mime
cp /vagrant/configs/apache.ports.conf /etc/apache2/ports.conf
service apache2 restart

# composer
curl -Ss https://getcomposer.org/installer | php -- --quiet --install-dir=/usr/local/bin --filename=composer

chmod -R a+r /var/log/apache2
chmod a+x /var/log/apache2

# uhh. file permissions are getting screwed up sometimes.
chown -R www-data:www-data /var/lib/php5
