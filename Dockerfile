#
# dockerfile for zoom framework
#

FROM ubuntu:16.04

MAINTAINER Herb Lainchbury <herb@dynamic-solutions.com>


RUN apt-get update

# install python3.6
RUN apt install -y wget
RUN apt-get update
RUN apt install -y build-essential
RUN apt-get update && apt update
RUN apt install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
RUN cd /tmp && wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz
RUN cd /tmp && tar xvf Python-3.6.1.tar.xz
RUN cd /tmp/Python-3.6.1 && ./configure && make altinstall

# install os packages
RUN apt-get -y install git
RUN apt-get -y install python3-pip

# setup MariaDB
RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
RUN add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://mariadb.mirror.colo-serv.net/repo/10.1/ubuntu xenial main'
RUN apt-get update
RUN echo mariadb-server-10.1 mysql-server/root_password password root | debconf-set-selections
RUN echo mariadb-server-10.1 mysql-server/root_password_again password root | debconf-set-selections
RUN apt-get -y -q install mariadb-server

# update pip3
RUN pip3 install --upgrade pip

# configure and start the server
ADD start.sh /tmp/start.sh

# run the server
EXPOSE 8080
CMD ["/bin/bash", "/tmp/start.sh"]
