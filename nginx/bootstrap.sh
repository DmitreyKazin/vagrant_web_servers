#!/usr/bin/env bash

# system update
apt update
# install nginx
apt install -y nginx
# install 
apt install -y fcgiwrap
# append to fcgiwrap.conf
cat /vagrant/fcgiwrap.conf >> /etc/nginx/fcgiwrap.conf
# append to nginx configuration file
cat /vagrant/mycgi.conf > /etc/nginx/sites-enabled/default 
# it's not the smartest solution but as I run out of time I submit it
# could be replaced with sed -i (I got stucked cause while using sed I don't see the i in start of the word include)

# reload nginx
nginx -s reload
# create cgi-bin directory under user/lib
sudo mkdir -vp /usr/lib/cgi-bin/


# install python pip module
apt install -y python3-pip
# install requests with pip
python3 -m pip install requests

# replace default index.html in /var/www
rm -f /var/www/html/index.nginx-debian.html
cp /vagrant/html/index.html /var/www/html/index.html

# add script.py to /usr/lib/cgi-bin
cp /vagrant/html/script.py /usr/lib/cgi-bin/script.py
# perform something like dos2unix
sed -ie 's/\r//' /usr/lib/cgi-bin/script.py
# removing back up created 
rm -f /usr/lib/cgi-bin/script.pye
