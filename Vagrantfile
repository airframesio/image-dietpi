# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ravenclaw900/dietpi"
  config.ssh.username = "dietpi"

  config.vm.network "public_network", bridge: "en0: Ethernet", use_dhcp_assigned_default_route: true
  config.vm.network "forwarded_port", guest: 80, host: 8888

  config.vm.provision "shell", path: "https://raw.githubusercontent.com/airframesio/image-dietpi/main/scripts/remote-install.sh"

  config.vm.provision "file", source: "../feeder-web/index.html", destination: "/tmp/index.html"
  config.vm.provision "shell", inline: "mv /tmp/index.html /var/www/html/index.html"
end
