#!/bin/bash
set -e

# Disable the modules we don't need and enable the modules we need
a2enmod fcgid
a2dismod -f auth_basic authn_file authn_core authz_host authz_user autoindex dir status
rm /etc/apache2/mods-enabled/alias.conf

mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

mv /usr/bin/qgis_mapserv.fcgi /usr/lib/cgi-bin/

# Make sure logs go to STDOUT
sed -ri '
    s!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g;
    s!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g;
    ' /etc/apache2/sites-enabled/000-default.conf /etc/apache2/apache2.conf

mkdir -p /var/www/.qgis2
chown www-data: /var/www/.qgis2
