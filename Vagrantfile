# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile version. Don't touch.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Vagrant configuration.
  config.vm.box = "ubuntu/trusty64" # 14.04 LTS
  config.vm.hostname = "westvault"
  
  config.vm.network "forwarded_port", guest: 80, host: 8181

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "2"
    vb.gui = false
    vb.name = "westvault"
  end
  
  shared_dir = "/vagrant"

  config.vm.provision :shell, path: "scripts/setup.sh"
  config.vm.provision :shell, path: "scripts/staging.sh"
  config.vm.provision :shell, path: "scripts/owncloud.sh"
  
end
