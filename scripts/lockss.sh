#!/bin/bash

debconf-set-selections <<< 'oracle-java8-installer	shared/accepted-oracle-license-v1-1	select	true'

add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java8-installer ant ant-optional junit

pushd /var/www

	git clone --depth 1 --branch master https://github.com/lockss/lockss-daemon.git
	pushd lockss-daemon
		
		export JAVA_HOME=/usr/lib/jvm/java-8-oracle
		ant btf
		
		pushd test/frameworks/run_multiple_daemons
		
			cp /vagrant/configs/lockss/test1-local.txt test1/local.txt
			cp /vagrant/configs/lockss/test2-local.txt test2/local.txt
			cp /vagrant/configs/lockss/test3-local.txt test3/local.txt
			cp /vagrant/configs/lockss/test4-local.txt test4/local.txt
			
			./doall start
		popd
		
	popd
popd
