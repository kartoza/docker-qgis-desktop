#!/bin/bash
set -e
apt -y update
apt install -y software-properties-common
add-apt-repository ppa:ubuntugis/ubuntugis-unstable
apt -y update

# #-------------Application Specific Stuff ----------------------------------------------------
# removed: doxygen cmake-curses-gui
LC_ALL=C DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y \
    git cmake flex bison libproj-dev libgeos-dev libgdal1-dev \
    libexpat1-dev libfcgi-dev libgsl0-dev libpq-dev libqca2-dev libqca2-plugin-ossl \
    libqscintilla2-dev libqt4-dev libqt4-opengl-dev libqt4-sql-sqlite \
    libqtwebkit-dev libqwt-dev libspatialindex-dev libspatialite-dev libsqlite3-dev \
    lighttpd locales pkg-config poppler-utils pyqt4-dev-tools python python-dev \
    python-qt4 python-qt4-dev python-qt4-sql python-sip python-sip-dev python-setuptools \
    spawn-fcgi xauth xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable xvfb \
    python-pip gdal-bin python-gdal pyqt4.qsci-dev python-qscintilla2 python-pyspatialite g++

pip install --upgrade pip==9.0.3
pip install requests psycopg2 jinja2 pygments

chmod -R a+w /usr/lib/x86_64-linux-gnu/qt4/plugins/designer/
chmod -R a+w /usr/lib/python2.7/dist-packages/PyQt4/uic/widget-plugins/
