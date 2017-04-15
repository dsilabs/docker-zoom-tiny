
echo Setting up

# put libraries on the python path
echo /tmp/zoom > zoom.pth
mv zoom.pth /usr/local/lib/python3.5/dist-packages

# setup the zoom config file
echo -e "[database]\\ndbname=zoomdata\\ndbuser=root\\ndbpass=root" > /tmp/zoom/web/sites/localhost/site.ini
echo -e "[apps]\\npath=../../apps" >> /tmp/zoom/web/sites/localhost/site.ini
