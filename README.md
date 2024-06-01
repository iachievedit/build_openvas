# build_openvas

A set of scripts designed to (quickly) build OpenVAS on Ubuntu 24.04.

## Quick Start

```
sudo su
cd /tmp
git clone https://github.com/iachievedit/build_openvas
cd build_openvas
./install.sh
```

Some minutes later you should have an installation of OpenVAS ready to begin vulnerability scanning.

## Notes

* These scripts are designed to run as `root`.  If that causes you heartburn and discomfort, please see the
[canonical instructions](https://greenbone.github.io/docs/latest/22.4/source-build/).
* The default version of PostgreSQL supported in the source is 15, whereas Ubuntu 24.04 ships with 16.  The
scripts patch `FindPostgreSQL.cmake` to enable version 16.
* The systemd startup script included here listens on address `0.0.0.0` instead of `127.0.0.1`.
* Only `http` is supported in the scripts, though configuring `https` with a provider such as Let's Encrypt should not be difficult.
