# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
            #config.vm.box = "ashum1976/centos7_kernel_5.10"
            config.vm.box = "centos/7"

            config.vm.define "prod_server" do |prod|
                #prod.vm.synced_folder "./sync_data_server", "/home/vagrant/mnt"
                prod.vm.network "private_network", ip: "192.168.50.10", virtualbox__intnet: "net1"
                prod.vm.hostname = "prod-server"
                config.vm.provider "virtualbox" do |v|
                    v.memory = 256
                    v.cpus = 1
                end
            #    prod.vm.provision "shell", path: "nfss_script.sh"
            end

            # config.vm.define "adm_comp" do |adm|
            #     #adm.vm.synced_folder "./sync_data_client", "/home/vagrant/mnt"
            #     adm.vm.network "private_network", ip: "192.168.50.11", virtualbox__intnet: "net1"
            #     adm.vm.hostname = "admin-comp"
            #     config.vm.provider "virtualbox" do |v|
            #         v.memory = 256
            #         v.cpus = 1
            #     end
            #   #  adm.vm.provision "shell", path: "nfsc_script.sh"
            # end

end
