# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  `VBoxManage setproperty machinefolder ~/Virtualbox`

  %w(supa supb).to_enum.with_index(26).each do |s,i|
    config.vm.define s.to_sym do |machine|
	machine.vm.box = 'ubuntu-13.04_puppet-3.3.1' 
	config.vm.network :public_network, {:ip => "192.168.3.20#{i}", :bridge => 'eth0'}
	machine.vm.network :private_network, ip: "192.168.2.#{i}"
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
