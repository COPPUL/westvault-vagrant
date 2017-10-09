#!/bin/bash

# root's config
pushd $HOME
	git clone https://github.com/ubermichael/dot-files.git
		pushd dot-files
			./install.sh
		popd
	rm .bashrc
	ln -s .profile .bashrc

	git clone https://github.com/ubermichael/dot-emacs.git
	pushd dot-emacs
		make
	popd

	cp /vagrant/configs/mysql/my.cnf /root/.my.cnf
	chown -R root:root .
popd

# vagrant's config
pushd ~vagrant
	git clone https://github.com/ubermichael/dot-files.git
	pushd dot-files
		HOME=~vagrant ./install.sh
	popd
	rm .bashrc
	ln -s .profile .bashrc
	
	git clone https://github.com/ubermichael/dot-emacs.git
	pushd dot-emacs
		make
	popd

	cp /vagrant/configs/mysql/my.cnf /home/vagrant/.my.cnf
	chown -R vagrant:vagrant .
popd
