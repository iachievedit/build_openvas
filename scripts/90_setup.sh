#!/bin/bash
#
source ../exports.sh

apt install -y redis-server mosquitto

cp $SOURCE_DIR/openvas-scanner-$OPENVAS_SCANNER_VERSION/config/redis-openvas.conf /etc/redis/
chown redis:redis /etc/redis/redis-openvas.conf
echo "db_address = /run/redis-openvas/redis.sock" | sudo tee -a /etc/openvas/openvas.conf

systemctl start redis-server@openvas.service
systemctl enable redis-server@openvas.service
usermod -aG redis gvm

mkdir -p /var/lib/notus
mkdir -p /run/gvmd

chown -R gvm:gvm /var/lib/gvm
chown -R gvm:gvm /var/lib/openvas
chown -R gvm:gvm /var/lib/notus
chown -R gvm:gvm /var/log/gvm
chown -R gvm:gvm /run/gvmd

chmod -R g+srw /var/lib/gvm
chmod -R g+srw /var/lib/openvas
chmod -R g+srw /var/log/gvm

chown gvm:gvm /usr/local/sbin/gvmd
chmod 6750 /usr/local/sbin/gvmd

curl -f -L https://www.greenbone.net/GBCommunitySigningKey.asc -o /tmp/GBCommunitySigningKey.asc

export GNUPGHOME=/tmp/openvas-gnupg
mkdir -p $GNUPGHOME

gpg --import /tmp/GBCommunitySigningKey.asc
echo "8AE4BE429B60A59B311C2E739823FAA60ED1E580:6:" | gpg --import-ownertrust

export OPENVAS_GNUPG_HOME=/etc/openvas/gnupg
mkdir -p $OPENVAS_GNUPG_HOME
cp -r /tmp/openvas-gnupg/* $OPENVAS_GNUPG_HOME/
chown -R gvm:gvm $OPENVAS_GNUPG_HOME

apt install -y postgresql
systemctl start postgresql@16-main

sudo -u postgres bash <<EOF
cd
createuser -DRS gvm
createdb -O gvm gvmd
psql gvmd -c "create role dba with superuser noinherit; grant dba to gvm;"
EOF
