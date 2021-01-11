Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.vm.network "private_network", ip: "192.168.100.10"
    config.vm.synced_folder ".", "/vagrant", disabled: false
    config.vm.provision "shell", path: "./test.sh", privileged: true

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "8000"]
        vb.customize ["modifyvm", :id, "--cpus", "2"]
      end
   end


