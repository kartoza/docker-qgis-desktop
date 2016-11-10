#!/bin/bash
set -e

cd /build
git clone --depth 1 -b final-2_14_8 git://github.com/qgis/QGIS.git
cd QGIS
#git checkout final-2_14_8
