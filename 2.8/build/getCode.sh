#!/bin/bash
set -e

cd /build
git clone --depth 1 -b final-2_8_9 git://github.com/qgis/QGIS.git
cd QGIS
