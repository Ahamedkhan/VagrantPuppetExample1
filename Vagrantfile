# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/6"
  config.vm.hostname = "vagrant"
  config.vm.network "private_network", ip: "192.168.33.20"
  config.vm.synced_folder ".", "/var/www/", type: "virtualbox"
  config.vm.provision :shell, :path => "centos_6_x.sh"
  
  config.ssh.insert_key = false
  
	config.vm.provider "virtualbox" do |v|
		v.memory = 2048
		v.cpus = 2
	end

	config.vm.provision :puppet do |puppet|
		puppet.manifest_file  = "nodes.pp"
		puppet.manifests_path = "puppet/manifests/"
		puppet.module_path = "puppet/modules/"
		#puppet.options = "--verbose --debug"
	end
 
 end