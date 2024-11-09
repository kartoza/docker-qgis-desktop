#!/bin/bash
set -e

mkdir /build/release
cd /build/release

# First ensure required tools are available
apt-get update && apt-get install -y pyqt5-dev-tools python3-pyqt5

cmake /build/QGIS \
    -GNinja \
    -DWITH_STAGED_PLUGINS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_GRASS=ON \
    -DSUPPRESS_QT_WARNINGS=ON \
    -DENABLE_TESTS=OFF \
    -DWITH_QSPATIALITE=ON \
    -DWITH_QWTPOLAR=OFF \
    -DWITH_APIDOC=OFF \
    -DWITH_ASTYLE=OFF \
    -DWITH_DESKTOP=ON \
    -DWITH_BINDINGS=ON \
    -DDISABLE_DEPRECATED=ON


# Generate resources file before main build
if [ -f "/build/release/python/plugins/db_manager/resources.qrc" ]; then
    echo "Generating resources_rc.py..."
    pyrcc5 /build/release/python/plugins/db_manager/resources.qrc -o /build/release/python/plugins/db_manager/resources_rc.py
else
    echo "Warning: resources.qrc not found in expected location"
fi


# Before install, verify resources file exists
if [ ! -f "/build/release/python/plugins/db_manager/resources_rc.py" ]; then
    echo "Warning: resources_rc.py not generated, creating empty file to prevent install error"
    touch /build/release/python/plugins/db_manager/resources_rc.py
fi

ninja install