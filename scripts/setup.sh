#!/bin/bash

if [ -z "$PS1" ]; then
	set -euo pipefail
	unalias -a
fi

# do some yum things.
yum update -y

# add the epel repo.
yum install -y epel-release yum-utils ntpdate

# what time is it?
ntpdate -u ntp.ubc.ca

# time is difficult.
timedatectl set-timezone America/Vancouver

# basics.
yum install -y git curl emacs-nox gnupg zip unzip make perl bzip2

# make selinux permissive.
setenforce 0
