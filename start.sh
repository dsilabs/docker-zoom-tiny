
# start database
service mysql start

# create database and site
mkdir web/sites/localhost
zoom database -e mysql -u root -proot -d zoomdata setup localhost

# run server
zoom server web
