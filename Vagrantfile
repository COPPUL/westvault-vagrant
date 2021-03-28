# -*- mode: ruby -*-
# vi: set ft=ruby :

# plugins:
# vagrant plugin install vagrant-disksize

$message = <<MESSAGE

------------------------------------------------------

Install of staging server complete.

PHP: http://localhost:8181/info.php
OwnCloud: http://localhost:8181/owncloud
  user names corey, mark, michael
Staging Server: http://localhost:8181/westvault/
  credentials: admin@example.com admin
LOCKSSOMatic: http://localhost:8181/lockssomatic
  credentials: admin@example.com admin

Server access: smb://vagrant:vagrant@10.0.0.10

------------------------------------------------------

MESSAGE

Vagrant.configure("2") do |config|
  # Vagrant configuration.
  config.vm.post_up_message = $message
  config.vm.box = "centos/7"

  config.disksize.size = '20Gb'
  config.vm.hostname = "wv2"

  # mysql. sigh.
  config.vm.network "private_network", ip: "10.0.0.10"

  # web server
  config.vm.network "forwarded_port", guest: 80, host: 8181

  # lockss box UIs in the test framework
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.network "forwarded_port", guest: 8082, host: 8082
  config.vm.network "forwarded_port", guest: 8083, host: 8083
  config.vm.network "forwarded_port", guest: 8084, host: 8084

  # lockss box content servers
  config.vm.network "forwarded_port", guest: 8281, host: 8281

  #mysql
  config.vm.network "forwarded_port", guest: 3306, host: 33306

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2046"
    vb.cpus = "2"
    vb.gui = false
    vb.name = "wv2"
  end

  config.vm.provision :shell, path: "scripts/setup.sh"
  config.vm.provision :shell, path: "scripts/user.sh"
  config.vm.provision :shell, path: "scripts/samba.sh"
  config.vm.provision :shell, path: "scripts/lamp.sh"
  config.vm.provision :shell, path: "scripts/owncloud.sh"
  config.vm.provision :shell, path: "scripts/staging.sh"
  config.vm.provision :shell, path: "scripts/lockssomatic.sh"

# add some code to stop the LOCKSS daemon and maybe clean it up a bit here.
# requires the vagrant trigger plugin.
#  vagrant plugin install vagrant-triggers
#   config.trigger.before :halt do
#     run_remote  "bash /vagrant/cleanup.sh"
#   end
#
#   config.trigger.before :suspend do
#     run_remote  "bash /vagrant/cleanup.sh"
#   end

end
