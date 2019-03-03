#!/bin/bash

# do some yum things.
yum update -y

# add the epel repo.
yum install -y epel-release yum-utils ntpdate

# what time is it?
ntpdate -u ntp.ubc.ca

# time is difficult.
timedatectl set-timezone America/Vancouver

# basics.
yum install -y git vim wget curl emacs-nox gnupg zip unzip make

# make selinux permissive.
setenforce 0
