#--------- Generic stuff all our Dockerfiles should start with so we get caching ------------
FROM debian:stable
MAINTAINER Tim Sutton<tim@kartoza.com>


# Use local cached debs from host (saves your bandwidth!)
# # Change ip below to that of your apt-cacher-ng host
# # Or comment this line out if you do not with to use caching
#ADD 71-apt-cacher-ng /etc/apt/apt.conf.d/71-apt-cacher-ng

RUN echo "deb     http://qgis.org/debian wheezy main" >> /etc/apt/sources.list
RUN echo "deb-src     http://qgis.org/debian wheezy main" >> /etc/apt/sources.list
RUN gpg --keyserver keyserver.ubuntu.com --recv DD45F6C3
RUN gpg --export --armor DD45F6C3 | apt-key add -

RUN apt-get -y update

# #-------------Application Specific Stuff ----------------------------------------------------


RUN apt-get build-dep -y qgis
RUN chmod -R a+w /usr/lib/x86_64-linux-gnu/qt4/plugins/designer/
RUN chmod -R a+w /usr/lib/python2.7/dist-packages/PyQt4/uic/widget-plugins/

# Clone the 2.8.3 tag
RUN git clone --depth 1 -b final-2_8_3 git://github.com/qgis/QGIS.git; \
    mkdir /build; \
    cd /build; \
    cmake /QGIS -DQWT_INCLUDE_DIR=/usr/include/qwt -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr/local/qgis-master -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython2.7.so -DQSCINTILLA_INCLUDE_DIR=/usr/include/qt4 -DQWT_LIBRARY=/usr/lib/libqwt.so; \
    make install -j4; \
    cd /; \
    rm -rf /QGIS; \
    rm -rf /build; \
    ldconfig
 
WORKDIR /tmp

# Called on first run of docker
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

CMD /start.sh
