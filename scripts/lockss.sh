#!/bin/bash

apt-get install -y openjdk-7-jdk ant ant-optional junit gettext subversion
export JAVA_HOME=/usr/lib/jvm/default-java

pushd /var/www

	git clone --branch release-candidate_1-73-b2 --depth 1 https://github.com/lockss/lockss-daemon.git
	
	pushd lockss-daemon
 		ant btf
 		sudo chown -R vagrant:vagrant .
		
 		pushd test/frameworks/run_multiple_daemons
 		cp /vagrant/configs/lockss/lockss.txt lockss.txt
 		sudo chown -R vagrant:vagrant .
 		sudo -u vagrant ./start

	popd

popd
