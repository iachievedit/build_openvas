#!/bin/bash
#
#
#

source ../exports.sh 

apt update

apt upgrade -y

apt install --no-install-recommends --assume-yes \
  build-essential \
  curl \
  cmake \
  pkg-config \
  python3 \
  python3-pip \
  gnupg

# gvm-libs dependencies
apt install -y \
  libglib2.0-dev \
  libgpgme-dev \
  libgnutls28-dev \
  uuid-dev \
  libssh-gcrypt-dev \
  libhiredis-dev \
  libxml2-dev \
  libpcap-dev \
  libnet1-dev \
  libpaho-mqtt-dev

apt install -y \
  libldap2-dev \
  libradcli-dev

# gvmd dependenices
apt install -y \
  libglib2.0-dev \
  libgnutls28-dev \
  libpq-dev \
  postgresql-server-dev-16 \
  libical-dev \
  xsltproc \
  rsync \
  libbsd-dev \
  libgpgme-dev

apt install -y --no-install-recommends \
  texlive-latex-extra \
  texlive-fonts-recommended \
  xmlstarlet \
  zip \
  rpm \
  fakeroot \
  dpkg \
  nsis \
  gnupg \
  gpgsm \
  wget \
  sshpass \
  openssh-client \
  socat \
  snmp \
  python3 \
  smbclient \
  python3-lxml \
  gnutls-bin \
  xml-twig-tools

# pg-gvm
apt install -y \
  libglib2.0-dev \
  postgresql-server-dev-16 \
  libical-dev

# gsad
apt install -y \
  libmicrohttpd-dev \
  libxml2-dev \
  libglib2.0-dev \
  libgnutls28-dev

# openvas-scanner
apt install -y \
  bison \
  libglib2.0-dev \
  libgnutls28-dev \
  libgcrypt20-dev \
  libpcap-dev \
  libgpgme-dev \
  libksba-dev \
  rsync \
  nmap \
  libjson-glib-dev \
  libcurl4-gnutls-dev \
  libbsd-dev

apt install -y \
  python3-impacket \
  libsnmp-dev

# ospd-openvas
apt install -y \
  python3 \
  python3-pip \
  python3-setuptools \
  python3-wrapt \
  python3-cffi \
  python3-psutil \
  python3-lxml \
  python3-defusedxml \
  python3-paramiko \
  python3-redis \
  python3-gnupg \
  python3-paho-mqtt

# openvas
apt install -y 
  rust-all

apt install -y \
  pkg-config \
  libssl-dev
