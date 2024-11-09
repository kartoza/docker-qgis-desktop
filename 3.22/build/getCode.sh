#!/bin/bash
set -e

cd /build

ls
rm -rf QGIS

mv scripts/QGIS QGIS

cd QGIS

echo "db manager content"

echo "$(ls python/plugins/db_manager)"

pyrcc5 -o python/plugins/db_manager/resources_rc.py python/plugins/db_manager/resources.qrc

echo "$(ls python/plugins/db_manager)"
