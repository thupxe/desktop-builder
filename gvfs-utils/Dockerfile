FROM debian:bookworm
LABEL author="Miao Wang <shankerwangmiao@gmail.com>"
ARG mirror=http://deb.debian.org/debian

RUN rm /etc/apt/sources.list.d/debian.sources && \
    echo "deb $mirror bookworm main contrib non-free non-free-firmware" > /etc/apt/sources.list && \
    echo "deb-src $mirror bookworm main contrib non-free non-free-firmware" >> /etc/apt/sources.list && \
    echo "deb $mirror bookworm-updates main contrib non-free non-free-firmware" >> /etc/apt/sources.list && \
    echo "deb-src $mirror bookworm-updates main contrib non-free non-free-firmware" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org/debian-security bookworm-security main" >> /etc/apt/sources.list && \
    echo "deb-src http://security.debian.org/debian-security bookworm-security main" >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get build-dep --no-install-recommends -y gvfs
