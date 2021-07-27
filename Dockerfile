FROM debian:buster
MAINTAINER Miao Wang <shankerwangmiao@gmail.com>
ARG mirror=http://deb.debian.org/debian

RUN echo "deb $mirror buster main contrib non-free" > /etc/apt/sources.list && \
        echo "deb $mirror buster-backports main contrib non-free" >> /etc/apt/sources.list && \
        echo "deb $mirror buster-updates main contrib non-free" >> /etc/apt/sources.list && \
	echo "deb http://security.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list 

RUN apt-get update && \
    apt-get install --no-install-recommends -y wget curl rsync jq fdisk gdisk \
      tar bash e2fsprogs udpcast xz-utils gzip busybox parted kmod initramfs-tools \
      busybox intel-microcode amd64-microcode

RUN echo "AMD64UCODE_INITRAMFS=early" > /etc/default/amd64-microcode
RUN mkdir -p /lib/modules /target /mnt

COPY thupxe.hook /usr/share/initramfs-tools/hooks/thupxe
COPY thupxe.script /usr/share/initramfs-tools/scripts/thupxe
ADD kernel.tar.gz /

CMD /bin/bash
