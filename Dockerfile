#--------- Generic stuff all our Dockerfiles should start with so we get caching ------------
FROM ubuntu:trusty
MAINTAINER Tim Sutton<tim@kartoza.com>

RUN  export DEBIAN_FRONTEND=noninteractive
ENV  DEBIAN_FRONTEND noninteractive
RUN  dpkg-divert --local --rename --add /sbin/initctl
#RUN  ln -s /bin/true /sbin/initctl

# Use local cached debs from host (saves your bandwidth!)
# Change ip below to that of your apt-cacher-ng host
# Or comment this line out if you do not with to use caching
ADD 71-apt-cacher-ng /etc/apt/apt.conf.d/71-apt-cacher-ng

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get -y update

#-------------Application Specific Stuff ----------------------------------------------------

RUN echo "deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu trusty main" >> /etc/apt/sources.list
RUN gpg --keyserver keyserver.ubuntu.com --recv 314DF160 
RUN gpg --export --armor 314DF160 | sudo apt-key add -

RUN apt-get -y update

RUN apt-get install -y qgis-mapserver qgis libcanberra-gtk-module saga otb-bin
RUN apt-get purge

# Called on first run of docker - will run supervisor
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

CMD /start.sh
