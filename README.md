docker-qgis-desktop
===================

A simple docker container that runs QGIS desktop

Note this is still experimental and probably does not represent
the most optimal way to do this. Current limitations:

* docker user is root so will probably muck up your
  local user file permissions.
* Qt4 theme is not carried over nicely
* Still runs QGIS 2.0
* Uses xhost + which is not ideal since it allows all remote
  hosts to display windows on your X display (probably not
  an issue if you are on a local network).


Suggested way to build:
-----------------------

Clone the repo to your local system and then run the ``build.sh`` 
script - it will create a launcher script in `~/bin`, add `~/bin/`
to your `.bashrc` and create a desktop shortcut that will launch
QGIS. 

```
git clone 
git://github.com/kartoza/docker-qgis-desktop
cd docker-qgis-desktop
./build.sh
```

Alternative build:
------------------

To build the image do:

```
docker build -t kartoza/docker-qgis-desktop git://github.com/kartoza/docker-qgis-desktop
```

To run a container do:

```
docker kill qgis-desktop
docker rm qgis-desktop
xhost +
docker run --name="qgis-desktop" \
	-v ${HOME}/.config:/.config \
	-v ${HOME}/.gtkrc-2.0:/.gtkrc-2.0 \
	-v ${HOME}:/home/${USER} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	kartoza/qgis-server:latest \
	/usr/bin/qgis
xhost -
```

-----------

Tim Sutton (tim@kartoza.com)
July 2014
