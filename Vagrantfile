 # -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  config.vm.box = "ubuntu/trusty64"


  config.vm.define :haproxy, primary: true do |haproxy_config|
    haproxy_config.vm.hostname = 'haproxy'
    haproxy_config.vm.network :forwarded_port, guest: 8080, host: 8080, host_ip: "127.0.0.1"
    haproxy_config.vm.network :forwarded_port, guest: 80, host:8081, host_ip: "127.0.0.1"
    haproxy_config.vm.network :private_network, ip: "172.16.0.4"

    
    haproxy_config.vm.provision :shell, :path => "haproxy-setup.sh"
  end


  config.vm.define :webserver1 do |webserver1_config|
    webserver1_config.vm.hostname = 'webserver1'
    #configure network's forwarded ports here via .vm.network
    webserver1_config.vm.network :private_network, ip: "172.16.0.2"

    
    webserver1_config.vm.provision :shell, :path => "web-setup.sh"
  end

  #Webserver 2
  config.vm.define :webserver2 do |webserver2_config|
    webserver2_config.vm.hostname = 'webserver2'
    #configure network's forwarded ports here via .vm.network
    webserver2_config.vm.network :private_network, ip: "172.16.0.3"

    
    webserver2_config.vm.provision :shell, :path => "web-setup.sh"
  end
end
