# -*- mode: ruby -*-
# vi: set ft=ruby :

if ENV['VAGRANT_ROOT']
  VAGRANT_ROOT=ENV['VAGRANT_ROOT']
else
  VAGRANT_ROOT="~/vagrant_prgr"
end

Vagrant.configure("2") do |config|
  # Run bootstrap.sh script on first boot:
  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "#{VAGRANT_ROOT}", "/prgr"

  # forward x11 displays
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  # Performace settings for each vm:
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024 # 1 GiB of memory
    vb.cpus = 1      # 1 CPU Cores

    # Ensure time synchronization:
    vb.customize [ "guestproperty", "set", :id,
                   "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold",
                   1000 ]
    vb.customize ["modifyvm", :id, "--vram", "16", "--clipboard", "bidirectional"]
  end
  config.vm.provider :libvirt do |v, override|
    v.memory = 1024
    v.cpus = 1
    override.vm.synced_folder ".", "/vagrant", type: :rsync
    override.vm.synced_folder "#{VAGRANT_ROOT}", "/prgr", type: :rsync
  end

  # Main development machine:
  config.vm.define "dev", primary: true, autostart: true do |dev|
    dev.vm.provision "bootstrap", type: "shell", path: "arch/bootstrap.sh"
    dev.vm.box = "generic/arch"
    dev.vm.hostname = "dev"
    dev.vm.network "private_network", ip: "192.168.100.20"
    dev.vm.provider "virtualbox" do |v, override|
      v.memory = 2048
      v.cpus = 4
      v.customize ["modifyvm", :id, "--vram", "16", "--clipboard", "bidirectional"]
      override.vm.synced_folder ".", "/vagrant", type: "nfs"
      override.vm.synced_folder "#{VAGRANT_ROOT}", "/prgr", type: "nfs"
    end
    dev.vm.provider :libvirt do |v|
      v.memory = 2048
      v.cpus = 2
    end
  end

  config.vm.define "mnet", autostart: false do |mnet|
    mnet.vm.provision "bootstrap", type: "shell", path: "ubuntu/bootstrap.sh"
    mnet.vm.box = "ktr/mininet"
    mnet.vm.hostname = "mnet"
    mnet.vm.network "private_network", ip: "192.168.100.21"
    mnet.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
      v.gui = true
    end
  end
end
