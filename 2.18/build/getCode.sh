#!/bin/bash
set -e

cd /build
git clone --depth 1 -b final-2_18_24 git://github.com/qgis/QGIS.git
cd QGIS
