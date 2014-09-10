docker build -t kartoza/qgis-desktop:latest .
sudo cp run-qgis-in-docker.sh /usr/local/bin
sudo chmod +x ${HOME}/bin/run-qgis-in-docker.sh
sudo cp QGIS-2.4.Docker.desktop /usr/share/applications/
sudo cp qgis-icon-60x60.png /usr/local

echo "A shortcut was created to run your docker - "
echo "you may need to reload your desktop"
echo "or log out and in again for the shortcut to be available."
