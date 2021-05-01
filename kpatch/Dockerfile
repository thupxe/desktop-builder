FROM ubuntu:focal
MAINTAINER Miao Wang <shankerwangmiao@gmail.com>
ARG mirror=http://archive.ubuntu.com/ubuntu

RUN for i in "deb" "deb-src"; do \
      for j in "" "-updates" "-backports"; do \
        echo "${i} ${mirror} focal${j} main restricted universe multiverse"; \
      done; \
    done > /etc/apt/sources.list

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install build-essential \
      devscripts ccache gawk libelf-dev libssl-dev flex bison bc git \
      ubuntu-dbgsym-keyring

RUN for i in "" "-updates" "-proposed"; do \
      echo "deb http://ddebs.ubuntu.com focal${i} main restricted universe multiverse"; \
    done > /etc/apt/sources.list.d/ddebs.list && \
    apt-get update

RUN cd /tmp && \
    git clone https://github.com/dynup/kpatch.git && \
    cd kpatch/ && \
    make && \
    make install

CMD /bin/bash
