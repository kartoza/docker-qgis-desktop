#!/bin/bash
##
## GLOBALS
##
source globals.sh
##
## Build
##
docker build -t kartoza/qgis-desktop:${MAJOR}.${MINOR}.${BUGFIX} .
docker build -t kartoza/qgis-desktop:LTR .
sudo cp run-qgis-${MAJOR}.${MINOR}ltr-in-docker.sh /usr/local/bin
sudo cp QGIS-${MAJOR}.${MINOR}LTR.Docker.desktop /usr/share/applications/
sudo cp qgis-icon-60x60.png /usr/local

echo "A shortcut was created to run your docker - "
echo "you may need to reload your desktop"
echo "or log out and in again for the shortcut to be available."

docker tag kartoza/qgis-desktop:${MAJOR}.${MINOR}.${BUGFIX} kartoza/qgis-desktop:${MAJOR}.${MINOR}
docker tag kartoza/qgis-desktop:${MAJOR}.${MINOR}.${BUGFIX} kartoza/qgis-desktop:latest
docker push kartoza/qgis-desktop:${MAJOR}.${MINOR}.${BUGFIX}
docker push kartoza/qgis-desktop:${MAJOR}.${MINOR}
# We should rather push the 3.x image as latest
#docker push kartoza/qgis-desktop:latest
