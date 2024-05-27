#!/bin/bash
#

source ../exports.sh

apt install -y \
  python3 \
  python3-pip

mkdir -p $INSTALL_DIR/greenbone-feed-sync

python3 -m pip install --root=$INSTALL_DIR/greenbone-feed-sync --no-warn-script-location greenbone-feed-sync

cp -rv $INSTALL_DIR/greenbone-feed-sync/* /
