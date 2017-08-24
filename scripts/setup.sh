#!/bin/bash

apt-get -y update
apt-get -y upgrade

# passwordless mysql root
debconf-set-selections <<< "mysql-server mysql-server/root_password password \"''\""
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password \"''\""

# basics.
apt-get -y install git vim wget curl emacs24-nox 

# LAMP
apt-get -y install apache2 php5 php5-dev php5-xsl php5-curl php5-cli php5-intl mysql-client mysql-server

# staging server
apt-get -y install clamav clamav-daemon nodejs nodejs-dev npm php-pear

curl -Ss https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer

npm install -g bower
pear install Archive_Tar
