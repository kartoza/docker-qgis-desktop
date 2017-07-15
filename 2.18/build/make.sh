#!/bin/bash
set -e

mkdir /build/release
cd /build/release
cmake /build/QGIS \
    -DQWT_INCLUDE_DIR=/usr/include/qwt \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython2.7.so \
    -DQSCINTILLA_INCLUDE_DIR=/usr/include/qt4 \
    -DQWT_LIBRARY=/usr/lib/libqwt.so \
    -DWITH_DESKTOP=OFF \
    -DWITH_SERVER=ON \
    -DBUILD_TESTING=OFF \
    -DWITH_INTERNAL_QWTPOLAR=ON

make install -j8
ldconfig

strip /usr/bin/qgis_mapserv.fcgi
strip `find /usr/lib/ -name "libqgis*" -type f`
strip `find  /usr/share/qgis/ -name "*.so" -type f`

