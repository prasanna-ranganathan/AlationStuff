#!/bin/bash

if [ ! -f /etc/haproxy/haproxy.cfg ]; then

  # Install haproxy
  /usr/bin/apt-get -y install haproxy

 # Configure haproxy
  cat > /etc/default/haproxy <<EOD
# Set ENABLED to 1 if you want the init script to start haproxy.
ENABLED=1
# Add extra flags here.
#EXTRAOPTS="-de -m 16"
EOD

  cat > /etc/haproxy/haproxy.cfg <<EOD
global
    log /dev/log local0
    log     127.0.0.1 local1 notice
    user haproxy
    group haproxy
    daemon
    maxconn 4096

defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    timeout connect 5000
    timeout client  50000
    timeout server  50000

frontend localnodes
    bind *:80
    mode http
    default_backend nodes

backend nodes
    mode http
    balance roundrobin
    option forwardfor
    option httpchk HEAD / HTTP/1.1\r\nHost:localhost
    server webserver1 172.16.0.2:80 check
    server webserver2 172.16.0.3:80 check


listen admin
    bind *:8080
    stats enable
EOD

  cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.bkp
  /usr/sbin/service haproxy restart
fi
