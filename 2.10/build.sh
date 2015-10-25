#!/bin/bash
docker build -t kartoza/qgis-desktop:2.10 .
sudo cp run-qgis-2.10-in-docker.sh /usr/local/bin
sudo cp QGIS-2.10.Docker.desktop /usr/share/applications/
sudo cp qgis-icon-60x60.png /usr/local

echo "A shortcut was created to run your docker - "
echo "you may need to reload your desktop"
echo "or log out and in again for the shortcut to be available."
