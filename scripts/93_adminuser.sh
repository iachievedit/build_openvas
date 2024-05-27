#!/bin/bash
#

source ../exports.sh

tr -dc A-Za-z0-9 </dev/urandom | head -c 13 > $BUILD_OPENVAS_DIR/adminpass.txt

/usr/local/sbin/gvmd --create-user=admin --password `cat $BUILD_OPENVAS_DIR/adminpass.txt`

/usr/local/sbin/gvmd --modify-setting 78eceaec-3385-11ea-b237-28d24461215b --value `/usr/local/sbin/gvmd --get-users --verbose | grep admin | awk '{print $2}'`
