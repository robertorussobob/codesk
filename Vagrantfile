# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.disk :disk, size: "100GB", primary: true 
  #config.disksize.size "40GB" 

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on the "Usage" link above
    config.cache.scope = :box

    # OPTIONAL: If you are using VirtualBox, you might want to use that to enable
    # NFS for shared folders. This is also very useful for vagrant-libvirt if you
    # want bi-directional sync
    #config.cache.synced_folder_opts = {
    #  type: :nfs,
    #  # The nolock option can be useful for an NFSv3 client that wants to avoid the
    #  # NLM sideband protocol. Without this option, apt-get might hang if it tries
    #  # to lock files needed for /var/cache/* operations. All of this can be avoided
    #  # by using NFSv4 everywhere. Please note that the tcp option is not the default.
    #  mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    #}
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.usable_port_range = 8000..9999
  config.vm.network "forwarded_port", guest: 8001, host: 8001, auto_correct: true, host_ip: "127.0.0.1" # PostgreSQL
  config.vm.network "forwarded_port", guest: 8002, host: 8002, auto_correct: true, host_ip: "127.0.0.1" # LocalStack
  config.vm.network "forwarded_port", guest: 8003, host: 8003, auto_correct: true, host_ip: "127.0.0.1" # Redis
  config.vm.network "forwarded_port", guest: 8004, host: 8004, auto_correct: true, host_ip: "127.0.0.1" # MemCached
  config.vm.network "forwarded_port", guest: 8005, host: 8005, auto_correct: true, host_ip: "127.0.0.1" # Nginx
  config.vm.network "forwarded_port", guest: 8006, host: 8006, auto_correct: true, host_ip: "127.0.0.1" # Gitea
  config.vm.network "forwarded_port", guest: 9001, host: 9001, auto_correct: true, host_ip: "127.0.0.1" # pgAdmin
  config.vm.network "forwarded_port", guest: 9002, host: 9002, auto_correct: true, host_ip: "127.0.0.1" # Jenkins
  config.vm.network "forwarded_port", guest: 9003, host: 9003, auto_correct: true, host_ip: "127.0.0.1" # Allure
  config.vm.network "forwarded_port", guest: 9004, host: 9004, auto_correct: true, host_ip: "127.0.0.1" # Wordpress
  config.vm.network "forwarded_port", guest: 9005, host: 9005, auto_correct: true, host_ip: "127.0.0.1" # Kafka UI
  config.vm.network "forwarded_port", guest: 9006, host: 9006, auto_correct: true, host_ip: "127.0.0.1" # Mongo Express
  config.vm.network "forwarded_port", guest: 9007, host: 9007, auto_correct: true, host_ip: "127.0.0.1" # Gitea
  config.vm.network "forwarded_port", guest: 9999, host: 9999, auto_correct: true, host_ip: "127.0.0.1" # cAdvisor
  config.vm.network "forwarded_port", guest: 9998, host: 9998, auto_correct: true, host_ip: "127.0.0.1" # Prometheus
  config.vm.network "forwarded_port", guest: 9997, host: 9997, auto_correct: true, host_ip: "127.0.0.1" # Grafana
  config.vm.network "forwarded_port", guest: 9996, host: 9996, auto_correct: true, host_ip: "127.0.0.1" # Portainer

#  config.vm.network "forwarded_port", guest: 8080, host: 8080
#  config.vm.network "forwarded_port", guest: 8081, host: 8081

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
    vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
    vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
  
    # Customize the amount of memory on the VM:
    #vb.memory = "4096"
    #vb.cpus = "2"
    vb.memory = "8182"
    vb.cpus = "4"
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    #vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  config.vm.provision :shell, privileged: false, path: "bootstrap.sh"
  config.vm.boot_timeout = 400
end
