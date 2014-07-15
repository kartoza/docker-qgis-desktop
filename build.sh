docker.io build -t kartoza/qgis-server:latest .
mkdir -p $HOME/bin
echo "# Next line added for running QGIS in docker" >> ${HOME}/.bashrc
echo "export \$PATH=\$PATH}:\${HOME}/bin" >> ${HOME}/.bashrc
cp run-qgis-in-docker.sh ${HOME}/bin
chmod +x ${HOME}/bin/run-run-qgis-in-docker.sh
cp QGIS-2.0.Docker.desktop ${HOME}/share/applications/

echo "A shortcut was created to run your docker - "
echo "you may need to reload your desktop"
echo "or log out and in again for the shortcut to be available."
