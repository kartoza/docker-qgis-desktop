#!/bin/bash

echo "Building docker containers and pushing to docker hub"
echo "Note the user running the builds needs to be logged in to docker for the push to work"
docker pull kartoza/qgis-base:v2
for DIR in `ls`
do 
  echo $DIR
  cd $DIR
  docker rmi kartoza/qgis-desktop:$DIR
  docker build -t kartoza/qgis-desktop:$DIR .
  cd -
  docker push kartoza/qgis-desktop:$DIR
done
docker push kartoza/qgis-desktop:LTR
