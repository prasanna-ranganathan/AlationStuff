#! /bin/bash

/usr/bin/apt-get -y update
/usr/bin/apt-get -y install nginx 

mv /usr/share/nginx/html/index.html /tmp/index.html

cat > /usr/share/nginx/html/index.html <<EOD 
<html><head><title>Hello World</title></head>
<body><h1>Hello World</h1> 
<p>Hello World from ${HOSTNAME}.</p> 
</body></html>
EOD

/usr/sbin/service nginx restart

