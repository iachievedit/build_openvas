#
# This file should be sourced 
#
BUILD_OPENVAS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export INSTALL_PREFIX=/usr/local
export PATH=$PATH:$INSTALL_PREFIX/sbin

export SOURCE_DIR=$BUILD_OPENVAS_DIR/working/source
export INSTALL_DIR=$BUILD_OPENVAS_DIR/working/install
export BUILD_DIR=$BUILD_OPENVAS_DIR/working/build

export GVM_LIBS_VERSION=22.8.0
export GVMD_VERSION=23.2.0
export PG_GVM_VERSION=22.6.4
export GSA_VERSION=23.0.0
export GSAD_VERSION=22.9.0
export OPENVAS_SCANNER_VERSION=23.0.1
export OSPD_OPENVAS_VERSION=22.6.2
export OPENVAS_DAEMON=23.0.1
