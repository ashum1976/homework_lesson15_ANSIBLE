# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV["LC_ALL"] = "en_US.UTF-8"
Vagrant.configure(2) do |config|
            config.vm.box = "centos/7"
            config.vm.define "prod_server" do |prod|
                prod.vm.network "private_network", ip: "192.168.50.10", virtualbox__extnet: "net1"
                prod.vm.hostname = "prod-server"
                config.vm.provider "virtualbox" do |v|
                    v.memory = 256
                    v.cpus = 1
                end
                prod.vm.provision ":ansible_local" do |ansible|
                  ansible.verbose = "vv"
                  ansible.install = "true"
                  ansible.limit = "all"
                  ansible.inventory_path = "./ansible/inventory/"
                  ansible.playbook = "prod-server.yml"
                end

            end

end
