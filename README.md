# Alation HomeWork Assignment

# Pre-requisites
 
  * Vagrant Version 1.9.3
  * Virtualbox version  5.1.18
  * Clone this repository `https://github.com/stuxnet78/AlationStuff.git` or download this [zip](https://github.com/stuxnet78/AlationStuff/archive/master.zip)
 
# About the Assignment
   
  This repo contains the Vagrantfile and two script files for haproxy and nginx for webservers. The vagrant boots the 3-VM machines. one for Loadbalancer(172.16.0.4), and two for webservers webserver1(172.16.0.2),webserver2(172.16.0.3) on Port 80 or HTTP.
  
  After booting the machine for Loadbalancer. It installs the haproxy application and uses the provisioned haproxy configuration and same goes for nginx webservers.
  
  * For checking the haproxy stats. http://172.16.0.4:8080/haproxy?stats
  
# Getting hands Dirty.

* Run the vagrant commands

```
$ git clone https://github.com/stuxnet78/AlationStuff.git
$ cd AlationStuff
$ vagrant up
```
The above vagrant command will bootup the 3-VM machines. For logining in to the haproxy machine.

`vagrant ssh haproxy`

After all the loadbalancer and webservers are up. Run the below command.

`$ curl 172.16.0.4 ` A loadbalancer server which uses Roundrobin algorithm to switch to the servers.

For individually check the webservers
`$ curl 172.16.0.2` - webserver 1
`$ curl 172.16.0.3` - webserver 2

Which will return the "hello world" as output.

  
  
