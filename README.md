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
docker pull kartoza/qgis-desktop:<version>
```

e.g.

```
docker pull kartoza/qgis-desktop:2.14
```

**Note:** We highly encourage you to pull a tagged version so that your
docker orchestrated architecture is repeatable.


Please see the README.md in each version directory below for useage 
examples.

These images are built as automated builds on 

https://hub.docker.com/r/kartoza/qgis-desktop/


-----------

Tim Sutton (tim@kartoza.com)
July 2014

