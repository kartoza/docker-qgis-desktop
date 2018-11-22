QGIS Desktop for Docker
========================

A simple docker container that runs QGIS desktop

**Note:** this is still experimental and probably does not represent
the most optimal way to do this. Current limitations:

* Qt4 theme is not carried over nicely
* Uses ``xhost +`` which is not ideal since it allows all remote
  hosts to display windows on your X display (probably not
  an issue if you are on a local network). **Note:** See #16 - you
  can avoid using ``xhost +`` by running the script as the docker
  user. You will need to modify my scripts accordingly.
* To use in Mac OS X docker host environment, you need to [install an X11 server like XQuartz and SOCAT to tunnel the connection](http://kartoza.com/how-to-run-a-linux-gui-application-on-osx-using-docker/).

This image is also the base image for the [QGIS-Server docker image](https://github.com/kartoza/docker-qgis-server).

# License

[GPL V2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)



# Example use with docker compose

Here is a contrived example showing how you can run QGIS Desktop
from a docker container using docker-compose. Note you may
need to run ``xhost +`` first. Example ``docker-compose`` follows:

```
db:
  image: kartoza/postgis:9.4-2.1
  environment:
    - USERNAME=docker
    - PASS=docker
  
qgisdesktop:
  image: kartoza/qgis-desktop:2.14
  hostname: qgis-server
  volumes:
    # Wherever you want to mount your data from
    - ./gis:/gis
    # Unix socket for X11
    - /tmp/.X11-unix:/tmp/.X11-unix
  links:
    - db:db
  environment: 
    - DISPLAY=unix:1
  command: /usr/bin/qgis

```

To run the example do:

```
docker-compose up
```

You should see QGIS start up and appear on your local display. For more detailed approaches 
to using and building the QGIS container, see below.

**Note:** The database in the above example is stateless (it will be deleted when
running ``docker-compose rm``). If you want to connect to the PG database from docker
use the following info:

* host: db
* database: gis
* user: docker
* password: docker

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
sudo cp run-qgis-master-in-docker.sh /usr/local/bin
sudo cp QGIS-2.8.Docker.desktop /usr/share/applications/
sudo cp qgis-icon-60x60.png /usr/local
```


## Build the image yourself:

Clone the repo to your local system and then run the ``build.sh`` 
script - it will create a launcher script in `/usr/local/bin`
and create a desktop shortcut that will launch QGIS. 

```
git clone git://github.com/kartoza/docker-qgis-desktop
# cd into one of the version directories
cd docker-qgis-desktop/master
./build.sh
```

## Alternative build:

To build the image do:

```
docker build -t kartoza/qgis-desktop git://github.com/kartoza/docker-qgis-desktop
```

If you follow this approach you will need to create the 
application launcher yourself, manually. Consult the sources in this
repository for more details on how to do that.

# Run a container

To run a container do (see alternative approach to doing this using docker-compose at the top of this document):

```
xhost +
# Users home is mounted as home
# --rm will remove the container as soon as it ends

docker run --rm --name="qgis-desktop-master" \
	-i -t \
	-v ${HOME}:/home/${USER} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	kartoza/qgis-desktop:latest 
xhost -
```
The above is the content of run-qgis-master-in-docker.sh so you can just
```
./run-qgis-master-in-docker.sh
```

Follow the instructions above to create a desktop shortcut. Then, when you
click on the QGIS icon this script will run and start the container. 

Note that your home directory will be mounted in the container and thus
accessible to QGIS. If you want other directories to be available, just add
them to run-qgis-in-docker.sh with -v flags. 

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
