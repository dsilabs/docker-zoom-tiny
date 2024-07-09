#
# Dockerfile standalone Zoom instance
#

FROM dsilabs/zoom:latest

RUN apt-get update
WORKDIR /work

# setup MariaDB
RUN apt-get install -qqy mariadb-server

# configure and start the service
ADD start.sh /tmp/start.sh

# run the server
EXPOSE 80
CMD ["/bin/bash", "/tmp/start.sh"]
