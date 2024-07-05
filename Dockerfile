#
# Dockerfile standalone Zoom instance
#

FROM dsilabs/zoom:latest

RUN apt-get update
WORKDIR /work

# install mysql 8.0
RUN apt-get install -y lsb-release
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.32-1_all.deb
RUN DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt-config_0.8.32-1_all.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

# configure and start the service
ADD start.sh /tmp/start.sh

# run the server
EXPOSE 80
CMD ["/bin/bash", "/tmp/start.sh"]
