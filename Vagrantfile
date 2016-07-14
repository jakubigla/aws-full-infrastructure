# -*- mode: ruby -*-
# vi: set ft=ruby :

# global configuration
VAGRANTFILE_API_VERSION = "2"
VAGRANT_BOX = "ubuntu/trusty64"
VAGRANT_BOX_MEMORY = 1024
VIRTUAL_BOX_NAME = "deployer"

# only change these lines if you know what you do
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = VAGRANT_BOX

    # forward ssh requests for public keys
    config.ssh.forward_agent = true

    config.vm.network "private_network", ip: "192.168.160.100"
    config.vm.synced_folder "./", "/vagrant"

    # configure virtual box
    config.vm.provider :virtualbox do |vb|
        vb.name = VIRTUAL_BOX_NAME
        vb.customize ["modifyvm", :id, "--memory", VAGRANT_BOX_MEMORY]
    end

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "plays/vagrant.yml"
        ansible.extra_vars = {"remote_user" => "vagrant"}
    end
end
