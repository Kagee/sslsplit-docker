# VERSION               1
FROM      ubuntu 
# phusion/baseimage
MAINTAINER Anders Einar Hilden <hildenae@gmail.com>

# Metadata
LABEL organization=hild1
LABEL program=sslsplit
# Specify container username e.g. training, demo
ENV VIRTUSER user
# Specify program
ENV PROG sslsplit
# Install directory 
ENV PREFIX /usr/local
# Path should include prefix
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PREFIX/bin

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -yq git build-essential libssl-dev libevent-dev libevent-2.0-5 pkg-config check

WORKDIR /root

RUN git clone https://github.com/droe/sslsplit.git

WORKDIR /root/sslsplit

RUN make
RUN make test
RUN make install
