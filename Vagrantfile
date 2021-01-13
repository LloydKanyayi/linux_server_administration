node1disk1 = "./node1disk1.vdi"
Vagrant.configure("2") do |config|

  config.vm.define "node1" do |node1|
    node1.vm.network "private_network", ip: "192.168.100.10"
    node1.vm.hostname = "node1"
    node1.vm.define "node1"
    node1.vm.box = "centos/7"
    node1.vm.disk :disk, size: "40GB", primary: true
    node1.vm.synced_folder ".", "/vagrant", disabled: false
    
    node1.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "8000"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      if not File.exists?(node1disk1)
        vb.customize ['createhd', '--filename', node1disk1, '--variant', 'Fixed', '--size', 20 * 1024]
        vb.customize ['storageattach', :id,  '--storagectl', 'IDE', '--port', 0, '--device', 1, '--type', 'hdd', '--medium', node1disk1]
      end
    end
    node1.vm.provision "shell", path: "./partition.sh", privileged: true
    node1.vm.provision "shell", path: "./test.sh", privileged: true
  end

end


