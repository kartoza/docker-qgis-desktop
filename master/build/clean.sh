#!/bin/bash
set -e

apt-get remove -y --purge krb5-multidev build-essential bison cmake make cpp cpp-4.9 g++ g++-4.9 gcc gcc-4.9 \
    flex libclang1-3.5 git qt4-qmake rsync cmake-data g++-5 git-man liberror-perl qt4-linguist-tools libqt4-dev-bin
dpkg --purge `dpkg -l "*-dev" | sed -ne 's/ii  \(.*-dev\(:amd64\)\?\) .*/\1/p'` || true

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -rf /build

# Clean some stuff that are not needed by the server
rm -r /usr/share/qgis/i18n
