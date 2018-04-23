#!/bin/bash
docker build -t samtwesa/qgis-desktop:3.0 .
sudo cp run-qgis-3.0-in-docker.sh /usr/local/bin
sudo cp qgis-icon-60x60.png /usr/local

echo "A shortcut was created to run your docker - "
echo "you may need to reload your desktop"
echo "or log out and in again for the shortcut to be available."
