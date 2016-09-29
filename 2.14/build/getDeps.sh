#!/bin/bash
set -e
apt-get -y update
apt-get install -y software-properties-common
add-apt-repository ppa:ubuntugis/ubuntugis-unstable
apt-get -y update

# #-------------Application Specific Stuff ----------------------------------------------------
# removed: doxygen cmake-curses-gui
LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get update &&  \
    apt-get install -y git cmake flex bison libproj-dev libgeos-dev libgdal1-dev \
    libexpat1-dev libfcgi-dev libgsl0-dev libpq-dev libqca2-dev libqca2-plugin-ossl \
    libqscintilla2-dev libqt4-dev libqt4-opengl-dev libqt4-sql-sqlite \
    libqtwebkit-dev libqwt-dev libspatialindex-dev libspatialite-dev libsqlite3-dev \
    lighttpd locales pkg-config poppler-utils pyqt4-dev-tools python python-dev \
    python-qt4 python-qt4-dev python-qt4-sql python-sip python-sip-dev \
    spawn-fcgi xauth xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable xvfb 

chmod -R a+w /usr/lib/x86_64-linux-gnu/qt4/plugins/designer/
chmod -R a+w /usr/lib/python2.7/dist-packages/PyQt4/uic/widget-plugins/
