# -*- mode: ruby -*-
# vi: set ft=ruby :

BASE_NET = ENV['BASE_NET'] || '192.168.2'

Vagrant.configure("2") do |config|

  %w(re-a re-b re-c re-d).to_enum.with_index(25).each do |s,i|
    config.vm.define s.to_sym do |node|
	node.vm.box = 'ubuntu-16.04.2_puppet-3.8.7'
	node.vm.hostname = "#{s}.local"

	config.vm.provider :libvirt do |domain, override|
        override.vm.network :private_network, ip: "#{BASE_NET}.#{i}"
        domain.uri = 'qemu+unix:///system'
        domain.memory = 2048
        domain.cpus = 2
        override.vm.synced_folder './', '/vagrant', type: 'nfs', nfs_udp: false, nfs_version: 4
      end

	node.vm.provision :puppet do |puppet|
	  puppet.manifests_path = 'manifests'
	  puppet.manifest_file  = 'default.pp'
	  puppet.options = '--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml'
	end
    end
  end

end
