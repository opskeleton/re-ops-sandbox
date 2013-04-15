# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  config.vm.box = 'ubuntu-12.10_puppet-3' 
  config.vm.box_url = 'http://ubuntuone.com/66A7lTtTcOnjBuOpUsn9P2' 
  config.vm.network :public_network
  config.vm.hostname = 'supernal.local'
  config.vm.network :private_network, ip: '192.168.1.26'

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file  = 'default.pp'
    puppet.options = '--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera.yaml'

  end

end
