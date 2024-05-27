#!/bin/bash
#
source ../exports.sh

if id "$USERNAME" &>/dev/null; then
  echo "User '$USERNAME' exists."
else
  sudo useradd -r -M -U -G sudo -s /usr/sbin/nologin gvm
fi
