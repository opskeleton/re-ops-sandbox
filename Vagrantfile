# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  %w(supa supb).to_enum.with_index(26).each do |s,i|
    config.vm.define s.to_sym do |machine|
	machine.vm.box = 'ubuntu-12.10_puppet-3' 
	machine.vm.box_url = 'http://ubuntuone.com/66A7lTtTcOnjBuOpUsn9P2' 
	machine.vm.network :public_network
	machine.vm.hostname = "#{s}.local"
	machine.vm.network :private_network, ip: "192.168.1.#{i}"

	machine.vm.provider :virtualbox do |vb|
	  vb.customize ['modifyvm', :id, '--memory', 512, '--cpus', 2]
	end

	machine.vm.provision :puppet do |puppet|
	  puppet.manifests_path = 'manifests'
	  puppet.manifest_file  = 'default.pp'
	  puppet.options = '--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml'
	end
    end
  end

end
