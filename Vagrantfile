# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "ctrl-01" do |node|
    node.vm.hostname = "ctrl-01"
    node.vm.box = "debian/jessie64"
    node.vm.network "private_network", virtualbox__intnet: "lan", ip: "10.100.1.1"
  end

  (1..4).each do |i|
    config.vm.define "node-0#{i}" do |node|
      node.vm.hostname = "node-0#{i}"
      node.vm.box = "debian/jessie64"
      node.vm.network "private_network", virtualbox__intnet: "lan", type: "dhcp"
    end
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "setup.yml"
    ansible.groups = {
      "controllers" => ["ctrl-01"],
      "nodes" => ["node-01", "node-02", "node-03", "node-04"],
    }

  end


end
