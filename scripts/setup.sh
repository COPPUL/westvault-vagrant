!/bin/bash

apt-get -y update
apt-get -y upgrade

# passwordless mysql root
debconf-set-selections <<< "mysql-server mysql-server/root_password password \"''\""
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password \"''\""
apt-get install -y mysql-client mysql-server 

# basics.
apt-get -y install git vim wget curl emacs24-nox gnupg

# LAMP
apt-get -y install apache2 php php-dev php-fxsl php-curl php-cli php-intl php-json php-mysql libapache2-mod-php php-pear
pear install Archive_Tar > /dev/null

# OwnCloud
apt-get -y install libxml2-utils 

# staging server
apt-get -y install clamav clamav-daemon 

# virus scanning
freshclam
/etc/init.d/clamav-daemon start

# node/npm/bower
apt-get -y install nodejs nodejs-dev npm
npm install --global --silent bower

# composer
curl -Ss https://getcomposer.org/installer | php -- --quiet --install-dir=/usr/local/bin --filename=composer
