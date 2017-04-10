#
# dockerfile for zoom framework
#

FROM ubuntu:14.04

MAINTAINER Herb Lainchbury <herb@dynamic-solutions.com>


# install os packages
RUN apt-get update
RUN apt-get -y install \
    git \
    mysql-client \
    mysql-server \
    wget

# install pip3
RUN cd /tmp && wget https://bootstrap.pypa.io/get-pip.py
RUN cd /tmp && python3 get-pip.py
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
