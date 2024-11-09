xhost +
docker run --rm --name="qgis-desktop-ltr" \
	-i -t \
	-v ${HOME}:/home/${USER} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	--net=host \
	kartoza/qgis-desktop:LTR
xhost -
