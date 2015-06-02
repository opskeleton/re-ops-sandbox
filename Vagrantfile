# -*- mode: ruby -*-
# vi: set ft=ruby :

BASE_NET = ENV['BASE_NET'] || '192.168.2'

Vagrant.configure("2") do |config|

  `VBoxManage setproperty machinefolder ~/Virtualbox`

  %w(supa supb).to_enum.with_index(26).each do |s,i|
    config.vm.define s.to_sym do |machine|
	machine.vm.box = 'ubuntu-14.10_puppet-3.7.3' 
	config.vm.network :public_network, {:bridge => 'eth0'}
	machine.vm.network :private_network, ip: "#{BASE_NET}.#{i}"
	machine.vm.hostname = "#{s}.local"

	machine.vm.provider :virtualbox do |vb|
	  vb.customize ['modifyvm', :id, '--memory', 1024, '--cpus', 2]
	end

	machine.vm.provision :puppet do |puppet|
	  puppet.manifests_path = 'manifests'
	  puppet.manifest_file  = 'default.pp'
	  puppet.options = '--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml'
	end
    end
  end

end
