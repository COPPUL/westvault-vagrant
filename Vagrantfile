# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile version. Don't touch.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Vagrant configuration.
  config.vm.box = "ubuntu/trusty64" # 14.04 LTS
  
  # requires the vagrant disksize plugin
  # vagrant plugin install vagrant-disksize
  config.disksize.size = '40Gb'
  config.vm.hostname = "westvault"

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

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "2"
    vb.gui = false
    vb.name = "westvault"
  end
  
  shared_dir = "/vagrant"
  
  config.vm.provision :shell, path: "scripts/setup.sh"
  config.vm.provision :shell, path: "scripts/samba.sh"  
  config.vm.provision :shell, path: "scripts/user.sh"
  config.vm.provision :shell, path: "scripts/lamp.sh"
  config.vm.provision :shell, path: "scripts/lockss.sh"
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
