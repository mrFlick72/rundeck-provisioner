# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos/8"
  config.vm.network "private_network", ip: "10.200.0.10"


   config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  
     # Customize the amount of memory on the VM:
     vb.memory = "4096"
   end
  

  config.vm.provision :shell, path: "provisioner.sh"

end
