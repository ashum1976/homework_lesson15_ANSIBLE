# -*- mode: ruby -*-
# vim: set ft=ruby :
home = ENV['HOME']

MACHINES = {
    'prod-nginx-01': {
        box_name: 'centos/7',
        ip_addr: '192.168.5.15',
        net_card_name:  'net1'
    },
    'prod-nginx-02': {
        box_name: 'centos/7',
        ip_addr: '192.168.5.20',
        net_card_name:  'net2'
    },
    'staging-nginx-01': {
        box_name: 'centos/7',
        ip_addr: '192.168.5.25',
        net_card_name:  'net3'
    },
    'admin-host':{
        box_name: 'centos/7',
        ip_addr: '192.168.5.2',
        net_card_name:  'net4'
    }
}

Vagrant.configure('2') do |config|
    MACHINES.each do |boxname, boxconfig|
        config.vm.define boxname do |box|
            box.vm.box = boxconfig[:box_name]
            box.vm.host_name = boxname.to_s
            box.vm.network 'private_network', ip: boxconfig[:ip_addr], virtualbox__intnet: boxconfig[:net_card_name]
            box.vm.provider :virtualbox do |vb|
                vb.memory = 256
                vb.cpus = 1
                # vb.customize ['modifyvm', :id, '--memory', '256']
                vb.name = boxname.to_s
            end
          #   box.vm.provision 'shell', inline: <<-SHELL
          # mkdir -p ~root/.ssh
          # cp ~vagrant/.ssh/auth* ~root/.ssh
          #   SHELL
        end
    end
end
