docker.io kill qgis-desktop
docker.io rm qgis-desktop
xhost +
# Config so QGIS finds your Qt and QGIS settings
# Gtkrc so Qt finds your Gtk settings
# Users home is mounted as home
docker.io run --name="qgis-desktop" \
	-v ${HOME}/.config:/.config \
        -v ${HOME}/.gtkrc-2.0:/.gtkrc-2.0 \
	-v ${HOME}:/home/${USER} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	kartoza/qgis-server:latest \
	/usr/bin/qgis
xhost -
