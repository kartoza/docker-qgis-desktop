#!/bin/bash
set -e

cd /build
#git clone --depth 1 -b master git://github.com/qgis/QGIS.git
git clone git://github.com/qgis/QGIS.git
cd QGIS
git checkout final-2_14_4
