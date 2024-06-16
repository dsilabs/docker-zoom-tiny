#
# Dockerfile standalone Zoom instance
#

ARG BASE_TAG=latest
FROM dsilabs/zoom:${BASE_TAG}

RUN apt-get update -qq
WORKDIR /work

# Setup MariaDB
RUN apt-get install -qqy mariadb-server

# Configure and start the service
ADD start.sh /tmp/start.sh

# Run the server
EXPOSE 80
CMD ["/bin/bash", "/tmp/start.sh"]
