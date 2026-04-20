nodes = [
  { :hostname => 'k8s-local-master', :ip => '192.168.56.101', :box => "bento/ubuntu-24.04", :ram => 2048, :disk => "64GB", :cpus => 1 },
  { :hostname => 'k8s-local-worker01', :ip => '192.168.56.111', :box => "bento/ubuntu-24.04", :ram => 2048, :disk => "64GB", :cpus => 1 },
  { :hostname => 'k8s-local-worker02', :ip => '192.168.56.112', :box => "bento/ubuntu-24.04", :ram => 2048, :disk => "64GB", :cpus => 1 }
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = "bento/ubuntu-24.04"
      nodeconfig.vm.hostname = node[:hostname]
      nodeconfig.vm.network :private_network, ip: node[:ip]
      nodeconfig.vm.disk :disk, size: node[:disk], primary: true

      memory = node[:ram]
      cpus = node[:cpus]
      nodeconfig.vm.provider :virtualbox do |vb|
        vb.memory = memory
        vb.cpus = cpus
        # vb.customize [ "modifyvm", :id, "--memory", memory.to_s, "--cpus", cpus.to_s]
      end
    end

    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    config.vm.provision "shell", inline: <<-SHELL
echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
SHELL

  end
end
