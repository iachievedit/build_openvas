#!/bin/bash
#
#

source ../exports.sh

curl -f -L https://github.com/greenbone/gvmd/archive/refs/tags/v$GVMD_VERSION.tar.gz -o $SOURCE_DIR/gvmd-$GVMD_VERSION.tar.gz

tar -C $SOURCE_DIR -xvzf $SOURCE_DIR/gvmd-$GVMD_VERSION.tar.gz

echo "Updating FindPostgreSQL.cmake"
cp $BUILD_OPENVAS_DIR/scripts/FindPostgreSQL.cmake $SOURCE_DIR/gvmd-$GVMD_VERSION/cmake/

mkdir -p $BUILD_DIR/gvmd && cd $BUILD_DIR/gvmd

cmake $SOURCE_DIR/gvmd-$GVMD_VERSION \
  -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX \
  -DCMAKE_BUILD_TYPE=Release \
  -DLOCALSTATEDIR=/var \
  -DSYSCONFDIR=/etc \
  -DGVM_DATA_DIR=/var \
  -DGVMD_RUN_DIR=/run/gvmd \
  -DOPENVAS_DEFAULT_SOCKET=/run/ospd/ospd-openvas.sock \
  -DGVM_FEED_LOCK_PATH=/var/lib/gvm/feed-update.lock \
  -DSYSTEMD_SERVICE_DIR=/lib/systemd/system \
  -DLOGROTATE_DIR=/etc/logrotate.d

make -j$(nproc)

mkdir -p $INSTALL_DIR/gvmd

make DESTDIR=$INSTALL_DIR/gvmd install

sudo cp -rv $INSTALL_DIR/gvmd/* /
