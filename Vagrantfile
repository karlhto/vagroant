# -*- mode: ruby -*-
# vi: set ft=ruby :

if ENV['VAGRANT_ROOT']
  VAGRANT_ROOT=ENV['VAGRANT_ROOT']
else
  VAGRANT_ROOT="~/vagrant"
end

Vagrant.configure("2") do |config|
    # Use a custom box:
    # https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one
    config.vm.box = "ubuntu/trusty64"

    # make sure SSH always has host keys
    config.vm.provision "ssh-host-keys", type: "shell", path: "scripts/ssh-host-keys.sh"

    # forward x11 displays
    config.ssh.forward_x11 = true

    # Run bootstrap.sh script on first boot:
    config.vm.provision "bootstrap", type: "shell", path: "bootstrap.sh"
    config.vm.synced_folder "#{VAGRANT_ROOT}", "/os_root",
                            rsync__args: ["--verbose", "--archive", "--delete", "-z", "--links"]

    # Performace settings for each vm:
    config.vm.provider "virtualbox" do |vb|
        vb.memory = 1024 # 1 GiB of memory
        vb.cpus = 1      # 1 CPU Cores

        # Ensure time synchronization:
        vb.customize [ "guestproperty", "set", :id,
                       "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold",
                       1000 ]
    end
    config.vm.provider :libvirt do |v, override|
      v.memory = 1024
      v.cpus = 1
      override.vm.synced_folder "#{VAGRANT_ROOT}", "/vagrant", type: :rsync
    end

    # Main development machine:
    config.vm.define "dev", primary: true, autostart: true do |dev|
      config.vm.hostname = "dev"
      config.vm.network "private_network", ip: "192.168.100.20"
      config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
        v.customize ["modifyvm", :id, "--vram", "16", "--clipboard", "bidirectional"]
      end
      config.vm.provider :libvirt do |v|
        v.memory = 2048
        v.cpus = 2
      end
    end
end
