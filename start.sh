

echo Setting up

# install latest zoom
cd /tmp \
  && git clone https://github.com/dsilabs/zoom.git \
  && pip3.6 install -r zoom/requirements.txt \
  && echo /tmp/zoom > zoom.pth \
  && mv zoom.pth /usr/local/lib/python3.6/dist-packages

# setup the zoom config file
echo -e "[database]\\ndbname=zoomdata\\ndbuser=root\\ndbpass=root" > /tmp/zoom/web/sites/localhost/site.ini
echo -e "[apps]\\npath=../../apps" >> /tmp/zoom/web/sites/localhost/site.ini

# create database
service mysql start
echo "create database zoomdata" | mysql -u root -proot
mysql -u root -proot zoomdata < /tmp/zoom/tools/zoom/sql/setup_mysql.sql

# run server
cd /tmp/zoom && bin/zoom3.6 server web
