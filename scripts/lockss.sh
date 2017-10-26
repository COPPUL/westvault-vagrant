#!/bin/bash

apt-get install -y openjdk-7-jdk ant ant-optional junit gettext subversion
export JAVA_HOME=/usr/lib/jvm/default-java

pushd /var/www

	git clone --depth 1 https://github.com/lockss/lockss-daemon.git
	
	pushd lockss-daemon
 		ant btf
 		ant clean-tdbxml 	
		cp /vagrant/configs/lockss/lockss.txt test/frameworks/run_multiple_daemons/lockss.opt  			
 		sudo chown -R vagrant:vagrant .
		
 		pushd test/frameworks/run_multiple_daemons
			sudo -u vagrant ./start
		popd
	popd
popd
