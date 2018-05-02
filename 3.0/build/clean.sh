#!/bin/bash
set -e

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -rf /build

# Clean some stuff that are not needed by the server
rm -r /usr/share/qgis/i18n
