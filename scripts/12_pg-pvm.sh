#!/bin/bash
#
source ../exports.sh

curl -f -L https://github.com/greenbone/pg-gvm/archive/refs/tags/v$PG_GVM_VERSION.tar.gz -o $SOURCE_DIR/pg-gvm-$PG_GVM_VERSION.tar.gz

tar -C $SOURCE_DIR -xvzf $SOURCE_DIR/pg-gvm-$PG_GVM_VERSION.tar.gz

mkdir -p $BUILD_DIR/pg-gvm && cd $BUILD_DIR/pg-gvm

cmake $SOURCE_DIR/pg-gvm-$PG_GVM_VERSION \
  -DCMAKE_BUILD_TYPE=Release

make -j$(nproc)

mkdir -p $INSTALL_DIR/pg-gvm

make DESTDIR=$INSTALL_DIR/pg-gvm install

sudo cp -rv $INSTALL_DIR/pg-gvm/* /
