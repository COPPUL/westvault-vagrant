#!/bin/bash

pushd $HOME
git clone https://github.com/ubermichael/dot-files.git
cd dot-files
./install.sh
rm -rf dot-files
chown -R ubuntu:ubuntu .
popd
