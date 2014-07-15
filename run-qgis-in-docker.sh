docker.io kill qgis-desktop
docker.io rm qgis-desktop
xhost +
docker.io run --name="qgis-desktop" \
	-v ${HOME}/.config:/.config \
	-v ${HOME}:/home/${USER} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	kartoza/qgis-server:latest \
	/usr/bin/qgis
xhost -
