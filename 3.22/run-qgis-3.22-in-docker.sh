xhost +
# --rm will remove the container as soon as it ends
docker run --rm --name="qgis-desktop-3.22" \
	-i -t \
	-v ${HOME}:/home/${USER} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	samtwesa/qgis-desktop:3.22
xhost -
