docker-qgis-desktop
===================

A simple docker container that runs QGIS desktop

Note this is still experimental and probably does not represent
the most optimal way to do this. Current limitations:

* Qt4 theme is not carried over nicely
* Uses xhost + which is not ideal since it allows all remote
  hosts to display windows on your X display (probably not
  an issue if you are on a local network).


# Getting the image

## Use the docker repository:

This will consume the most bandwidth for the initial build but 
will be easy to update thereafter. 

```
docker pull kartoza/qgis-desktop
```


You will also need to create the
desktop shortcut yourself by taking the resources from the git repo e.g.:


```
sudo cp run-qgis-2.8.4-in-docker.sh /usr/local/bin
sudo cp QGIS-2.8.4.Docker.desktop /usr/share/applications/
sudo cp qgis-icon-60x60.png /usr/local
```


## Build the image yourself:

Clone the repo to your local system and then run the ``build.sh`` 
script - it will create a launcher script in `/usr/local/bin`
and create a desktop shortcut that will launch QGIS. 

```
git clone git://github.com/kartoza/docker-qgis-desktop
cd docker-qgis-desktop
cd 2.8
./build.sh
```

##Alternative build:

To build the image do:

```
docker build -t kartoza/qgis-desktop git://github.com/kartoza/docker-qgis-desktop
```

If you follow this approach you will need to create the 
application launcher yourself, manually. Consult the sources in this
repository for more details on how to do that.

# Run a container

To run a container do:

```
xhost +
# Users home is mounted as home
# --rm will remove the container as soon as it ends

docker run --rm --name="qgis-desktop-2-8-4" \
	-i -t \
	-v ${HOME}:/home/${USER} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	kartoza/qgis-desktop:latest 
xhost -
```
The above is the content of run-qgis-2.8.0-in-docker.sh so you can just
```
./run-qgis-2.8.4-in-docker.sh
```

Follow the instructions above to create a desktop shortcut. Then, when you
click on the QGIS icon this script will run and start the container. 

Note that your home directory will be mounted in the container and thus
accessible to QGIS. If you want other directories to be available, just add
then to run-qgis-in-docker.sh with -v flags. 

If QGIS crashes or hangs it might leave an orphan docker process running. If
you see the process with 
```
docker ps
```
Then run 
```
docker stop <process id or container name>
```
Else run 
```
docker ps -a
```
then
```
docker rm <process id or container name>



-----------

Tim Sutton (tim@kartoza.com)
July 2014
