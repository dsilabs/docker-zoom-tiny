#
# dockerfile for zoom framework
#


FROM dsilabs/zoom-nginx:latest

MAINTAINER Herb Lainchbury <herb@dynamic-solutions.com>


RUN apt-get update
WORKDIR /work

# setup MariaDB
RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
RUN add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://mariadb.mirror.colo-serv.net/repo/10.1/ubuntu xenial main'
RUN apt-get update
RUN echo mariadb-server-10.1 mysql-server/root_password password root | debconf-set-selections
RUN echo mariadb-server-10.1 mysql-server/root_password_again password root | debconf-set-selections
RUN apt-get -y -q install mariadb-server

# configure and start the service
ADD start.sh /tmp/start.sh

# run the server
EXPOSE 80
CMD ["/bin/bash", "/tmp/start.sh"]
