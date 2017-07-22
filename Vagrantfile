# -*- mode: ruby -*-
# vi: set ft=ruby :

mac_address = {
  "node-01" => "b8:27:eb:0c:be:57",
  "node-02" => "b8:27:eb:0b:58:11",
  "node-03" => "b8:27:eb:c7:7c:a7",
  "node-04" => "b8:27:eb:29:d8:78",
}

Vagrant.configure("2") do |config|

  config.vm.define "ctrl-01" do |node|
    node.vm.hostname = "ctrl-01"
    node.vm.box = "debian/jessie64"
    node.vm.box_check_update = false
    node.vm.network "private_network", virtualbox__intnet: "lan", ip: "10.100.1.1", :mac => "b827eba7e01e"

    node.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end

  end

  (1..4).each do |i|
    config.vm.define "node-0#{i}" do |node|
      node.vm.hostname = "node-0#{i}"
      node.vm.box = "debian/jessie64"
      node.vm.box_check_update = false
      node.vm.network "private_network", virtualbox__intnet: "lan", type: "dhcp", :mac => "#{mac_address['node-0#{i}']}"

      node.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 1
      end
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
