#!/usr/bin/env bash

# system update
apt-get update
# install apache2
apt-get install -y apache2
# enable cgi module in apache2
cd /etc/apache2/mods-enabled
ln -s ../mods-available/cgi.load
cd /vagrant
# reload apache2
service apache2 reload

# install python pip module
apt install -y python3-pip
# install requests with pip
python3 -m pip install requests

# replace default index.html in /var/www
rm -f /var/www/html/index.html
cp /vagrant/html/index.html /var/www/html/index.html

# add script.py to /usr/lib/cgi-bin
cp /vagrant/html/script.py /usr/lib/cgi-bin/script.py
# perform something like dos2unix
sed -ie 's/\r//' /usr/lib/cgi-bin/script.py
# removing back up created 
rm -f /usr/lib/cgi-bin/script.pye

