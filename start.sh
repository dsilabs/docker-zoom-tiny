
# start database
service mysql start

# create database and site
mysql -e "create database zoomdata"
mysql -e "create user zoomuser identified by 'zoompass'"
mysql -e "grant all on *.* to zoomuser"
mysql zoomdata < /work/libs/zoom/zoom/sql/setup_mysql.sql
mkdir web/sites/localhost
cat <<EOT | tee "/work/web/sites/localhost/site.ini"
[site]
name=ZOOM

[database]
name=zoomdata
user=zoomuser
password=zoompass
EOT

mysql -e "alter user 'root'@'localhost' identified by 'root'; flush privileges;"

# start proxy server
service nginx restart

# run server
uwsgi --ini /work/uwsgi/uwsgi.ini
