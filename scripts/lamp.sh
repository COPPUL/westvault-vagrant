#!/bin/bash

# mysql is a PITA. 
export DEBIAN_FRONTEND="noninteractive"
apt-get -y install debconf-utils
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get -y install mysql-client mysql-server 

cp /vagrant/configs/mysql/mysql.server.cnf /etc/mysql/my.cnf

mysql --defaults-file=/vagrant/configs/mysql/my.cnf -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';"
mysql --defaults-file=/vagrant/configs/mysql/my.cnf -e "FLUSH PRIVILEGES;"

service mysql restart

# LAMP
add-apt-repository -y ppa:ondrej/php
apt-get update

apt-get -y install apache2 php5.6 php5.6-dev php5.6-xsl php5.6-curl php5.6-cli \
	php5.6-intl php5.6-json php5.6-zip php5.6-mbstring php5.6-gd php5.6-mysql \
	php5.6-mcrypt php5.6-imagick php5.6-soap libxml2-utils python3 python3-pip 
	
pear install Archive_Tar
a2enmod rewrite headers env dir mime
cp /vagrant/configs/apache/apache.ports.conf /etc/apache2/ports.conf
service apache2 restart

# composer
curl -Ss https://getcomposer.org/installer | php -- --quiet --install-dir=/usr/local/bin --filename=composer

chmod -R a+r /var/log/apache2
chmod a+x /var/log/apache2

# uhh. file permissions are getting screwed up sometimes.
# chown -R www-data:www-data /var/lib/php5
