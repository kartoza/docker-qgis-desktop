#!/bin/bash
set -e
apt-get -y update
apt-get install -y software-properties-common
add-apt-repository ppa:ubuntugis/ubuntugis-unstable
apt-get -y update

# #-------------Application Specific Stuff ----------------------------------------------------
# removed: doxygen cmake-curses-gui
LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get update &&  \
    apt-get install -y bison ca-certificates ccache cmake cmake-curses-gui dh-python doxygen expect \
     flex gdal-bin git graphviz grass-dev libexpat1-dev libfcgi-dev libgdal-dev libgeos-dev libgsl-dev \
      libpq-dev libproj-dev libqca-qt5-2-dev libqca-qt5-2-plugins libqt5opengl5-dev libqt5scintilla2-dev \
       libqt5sql5-sqlite libqt5svg5-dev libqt5webkit5-dev libqt5xmlpatterns5-dev libqwt-qt5-dev \
       libspatialindex-dev libspatialite-dev libsqlite3-dev libsqlite3-mod-spatialite libzip-dev lighttpd \
        locales ninja-build pkg-config poppler-utils pyqt5-dev pyqt5-dev-tools pyqt5.qsci-dev \
        python3-all-dev python3-dateutil python3-dev python3-future python3-gdal python3-httplib2 python3-jinja2 \
         python3-markupsafe python3-mock python3-nose2 python3-owslib python3-plotly python3-psycopg2 python3-pygments \
         python3-pyproj python3-pyqt5 python3-pyqt5.qsci python3-pyqt5.qtsql python3-pyqt5.qtsvg python3-requests \
          python3-sip python3-sip-dev python3-six python3-termcolor python3-tz python3-yaml qt5-default qt5keychain-dev \
           qtbase5-dev qtpositioning5-dev qttools5-dev qttools5-dev-tools spawn-fcgi txt2tags xauth xfonts-100dpi \
           xfonts-75dpi xfonts-base xfonts-scalable xvfb

# chmod -R a+w /usr/lib/x86_64-linux-gnu/qt5/plugins/designer/
# chmod -R a+w /usr/lib/python3.6/dist-packages/Pyqt5/uic/widget-plugins/


cd /usr/local/bin
ln -s /usr/bin/ccache gcc
ln -s /usr/bin/ccache g++
