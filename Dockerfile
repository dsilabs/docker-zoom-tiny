#
# dockerfile for zoom framework
#

FROM ubuntu:16.04

MAINTAINER Herb Lainchbury <herb@dynamic-solutions.com>


# install os packages
RUN apt-get update
RUN apt-get -y install \
    git \
    wget \
    python3-pip

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

# install zoom
RUN cd /tmp && git clone https://github.com/dsilabs/zoom.git
RUN cd /tmp && pip3 install -r zoom/requirements.txt

# upload scripts
ADD setup.sh /tmp/setup.sh
ADD start.sh /tmp/start.sh

# run the final setup
RUN /bin/bash /tmp/setup.sh

# run the server
EXPOSE 8080
CMD ["/bin/bash", "/tmp/start.sh"]
