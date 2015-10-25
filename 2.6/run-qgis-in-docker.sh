xhost +
# Config so QGIS finds your Qt and QGIS settings
# Gtkrc so Qt finds your Gtk settings
# Users home is mounted as home
# --rm will remove the container as soon as it ends
#	-v ${HOME}/.config:/.config \
#	-v ${HOME}/.gtkrc-2.0:/.gtkrc-2.0 \

docker run --rm --name="qgis-desktop-2-4" \
	-i -t \
	-v ${HOME}:/home/${USER} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	kartoza/qgis-desktop:latest 
xhost -
