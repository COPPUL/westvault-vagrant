#!/bin/bash

# root's config
pushd $HOME
git clone https://github.com/ubermichael/dot-files.git
pushd dot-files
./install.sh
popd

git clone https://github.com/ubermichael/dot-emacs.git
pushd dot-emacs
make
popd

chown -R root:root .
popd

# vagrant's config
pushd ~vagrant
git clone https://github.com/ubermichael/dot-files.git
pushd dot-files
HOME=~vagrant ./install.sh
popd

git clone https://github.com/ubermichael/dot-emacs.git
pushd dot-emacs
make
popd

chown -R vagrant:vagrant .
popd
