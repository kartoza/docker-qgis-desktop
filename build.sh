docker build -t kartoza/qgis-desktop:latest .
mkdir -p $HOME/bin
echo "# Next line added for running QGIS in docker" >> ${HOME}/.bashrc
echo "export PATH=\${PATH}:\${HOME}/bin" >> ${HOME}/.bashrc
cp run-qgis-in-docker.sh ${HOME}/bin
chmod +x ${HOME}/bin/run-qgis-in-docker.sh
cp QGIS-2.4.Docker.desktop ${HOME}/.local/share/applications/

echo "A shortcut was created to run your docker - "
echo "you may need to reload your desktop"
echo "or log out and in again for the shortcut to be available."
