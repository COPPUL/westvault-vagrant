# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile version. Don't touch.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Vagrant configuration.
  config.vm.box = "ubuntu/trusty64" # 14.04 LTS
  config.vm.hostname = "westvault"

  # mysql. sigh.
  config.vm.network "private_network", ip: "10.0.0.10"  

  # web server  
  config.vm.network "forwarded_port", guest: 80, host: 8181
  
  # lockss boxes in the test framework
  config.vm.network "forwarded_port", guest: 8081, host: 8881
  config.vm.network "forwarded_port", guest: 8082, host: 8882
  config.vm.network "forwarded_port", guest: 8083, host: 8883
  config.vm.network "forwarded_port", guest: 8084, host: 8884
  
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
  config.vm.provision :shell, path: "scripts/owncloud.sh"
  config.vm.provision :shell, path: "scripts/staging.sh"
  config.vm.provision :shell, path: "scripts/lockssomatic.sh"

end
