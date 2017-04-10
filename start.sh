
# create database
service mysql start
echo "create database zoomdata" | mysql -u root
mysql -u root zoomdata < /tmp/zoom/tools/zoom/sql/setup_mysql.sql

# run server
cd /tmp/zoom && tools/zoom/zoom server -vp 8080
