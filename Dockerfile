FROM debian:bookworm
LABEL author="Miao Wang <shankerwangmiao@gmail.com>"
ARG mirror=http://deb.debian.org/debian

RUN rm /etc/apt/sources.list.d/debian.sources && \
    echo "deb $mirror bookworm main contrib non-free non-free-firmware" > /etc/apt/sources.list && \
    echo "deb $mirror bookworm-backports main contrib non-free non-free-firmware" >> /etc/apt/sources.list && \
    echo "deb $mirror bookworm-updates main contrib non-free non-free-firmware" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org/debian-security bookworm-security main" >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get install --no-install-recommends -y wget curl rsync jq fdisk gdisk \
    tar bash e2fsprogs udpcast xz-utils gzip zstd parted kmod initramfs-tools \
    busybox intel-microcode amd64-microcode ethtool

RUN echo "AMD64UCODE_INITRAMFS=early" > /etc/default/amd64-microcode
RUN mkdir -p /lib/modules /target /mnt

COPY thupxe.hook /usr/share/initramfs-tools/hooks/thupxe
COPY thupxe.script /usr/share/initramfs-tools/scripts/thupxe
ADD kernel.tar /

CMD /bin/bash
