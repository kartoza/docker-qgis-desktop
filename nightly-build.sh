#!/bin/bash

echo "Building docker containers and pushing to docker hub"
echo "Note the user running the builds needs to be logged in to docker for the push to work"
# Make sure we have the latest base image so that
# any security updates etc are used. The base image
# has all the build dependencies but none of the 
# actual QGIS sources in it. It is an automated build and 
# should be rebuilt whenever there is an update pushed to the 
# debian base image.
docker pull kartoza/qgis-base:v2
for DIR in `ls`
do 
  echo $DIR
  cd $DIR
  # Remove old image so if forces a recompile
  docker rmi kartoza/qgis-desktop:$DIR
  docker build -t kartoza/qgis-desktop:$DIR .
  cd -
  docker push kartoza/qgis-desktop:$DIR
done
docker push kartoza/qgis-desktop:LTR
