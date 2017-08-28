#!/bin/bash

# safety first.
apt-get -y update
apt-get -y upgrade

# mysql is a PITA. 
export DEBIAN_FRONTEND="noninteractive"
apt-get -y install debconf-utils
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get -y install mysql-client mysql-server 
cp /vagrant/configs/my.cnf /home/vagrant/.my.cnf
cp /vagrant/configs/my.cnf /root/.my.cnf
chown -R ubuntu:ubuntu /home/ubuntu

# basics.
apt-get -y install git vim wget curl emacs24-nox php-elisp gnupg zip unzip

# LAMP
apt-get -y install apache2 php5 php5-dev php5-xsl php5-curl php5-cli php5-intl php5-json \
	php5-mysql libapache2-mod-php5 php-pear
pear install Archive_Tar
a2enmod rewrite headers env dir mime
service apache2 restart

# node/npm/bower
apt-get -y install nodejs nodejs-dev npm
npm install --global --silent bower

# composer
curl -Ss https://getcomposer.org/installer | php -- --quiet --install-dir=/usr/local/bin --filename=composer
chown -R vagrant:vagrant /home/vagrant