#!/bin/bash


# safety first.
apt-get -y update
apt-get -y upgrade

# time is difficult.
timedatectl set-timezone America/Vancouver

# basics.
apt-get -y install git vim wget curl emacs24-nox php-elisp gnupg zip unzip ntp

# what time is it?
ntpdate -u ntp.ubuntu.com
