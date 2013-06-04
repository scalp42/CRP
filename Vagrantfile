# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'berkshelf/vagrant'

Vagrant.configure("2") do |config|
  config.berkshelf.enabled = true

  config.vm.define :mysql_server do |mysql_server|
    mysql_server.vm.provider :virtualbox do |vb|
      # vb.gui = true
      vb.customize [
        'modifyvm', :id,
        '--name', "MySQL Server",
        '--cpus', 1,
        '--memory', 768,
        '--nictype1', 'virtio',
        '--nictype2', 'virtio'
      ]
    end
    mysql_server.vm.box = "ubuntu12.04.2"
    mysql_server.vm.box_url = "http://d1owbwdg5aiwzw.cloudfront.net/ubuntu12.04.2.box"
    mysql_server.vm.hostname = "mysql"
    mysql_server.vm.network :private_network, ip: "192.168.33.13"
    mysql_server.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true

    mysql_server.vm.provision :chef_solo do |chef|    
      chef.data_bags_path = "data_bags"
      chef.roles_path = "roles"
      chef.add_role "mysql" 
    end
  end

  config.vm.define :fuse_server do |fuse_server|
    fuse_server.vm.provider :virtualbox do |vb|
      # vb.gui = true
      vb.customize [
        'modifyvm', :id,
        '--name', "FuseESB Server",
        '--cpus', 2,
        '--memory', 2560,
        '--nictype1', 'virtio',
        '--nictype2', 'virtio'
      ]
    end
    fuse_server.vm.box = "ubuntu12.04.2"
    fuse_server.vm.box_url = "http://d1owbwdg5aiwzw.cloudfront.net/ubuntu12.04.2.box"
    fuse_server.vm.hostname = "fuse"
    fuse_server.vm.network :private_network, ip: "192.168.33.10"
    fuse_server.vm.network :forwarded_port, guest: 80, host: 8000, auto_correct: true
    fuse_server.vm.network :forwarded_port, guest: 8181, host: 8181, auto_correct: true

    fuse_server.vm.provision :chef_solo do |chef|
      chef.data_bags_path = "data_bags"
      chef.roles_path = "roles"      
      chef.add_role "fuse"
    end
    fuse_server.vm.provision :shell, :path => "fuse_deploy.sh"
  end
end
