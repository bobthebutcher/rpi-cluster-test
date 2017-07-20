# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "control" do |node|
    node.vm.hostname = "control"
    node.vm.box = "debian/jessie64"
    node.vm.network "private_network", virtualbox__intnet: "lan", ip: "10.100.1.1"
  end

  config.vm.define "client" do |node|
    node.vm.hostname = "client"
    node.vm.box = "debian/jessie64"
    node.vm.network "private_network", virtualbox__intnet: "lan", type: "dhcp"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "setup.yml"
    ansible.groups = {
      "controllers" => ["control"],
      "nodes" => ["client"],
    }

  end


end
