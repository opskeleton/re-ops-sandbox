# -*- mode: ruby -*-
# vi: set ft=ruby :

BASE_NET = ENV['BASE_NET'] || '192.168.2'

Vagrant.configure("2") do |config|

  %w(supa supb).to_enum.with_index(25).each do |s,i|
    config.vm.define s.to_sym do |node|
	node.vm.box = 'ubuntu-16.04.1_puppet-3.8.7'
	node.vm.network :private_network, ip: "#{BASE_NET}.#{i}"
	node.vm.hostname = "#{s}.local"

	node.vm.provision :puppet do |puppet|
	  puppet.manifests_path = 'manifests'
	  puppet.manifest_file  = 'default.pp'
	  puppet.options = '--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml'
	end
    end
  end

end
