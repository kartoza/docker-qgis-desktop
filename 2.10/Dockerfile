FROM kartoza/qgis-base:v2
MAINTAINER Tim Sutton<tim@kartoza.com>

# Clone the 2.8 branch
RUN git clone --depth 1 -b release-2_10 git://github.com/qgis/QGIS.git; \
    mkdir /build; \
    cd /build; \
    cmake /QGIS -DQWT_INCLUDE_DIR=/usr/include/qwt -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython2.7.so -DQSCINTILLA_INCLUDE_DIR=/usr/include/qt4 -DQWT_LIBRARY=/usr/lib/libqwt.so; \
    make install -j4; \
    cd /; \
    rm -rf /QGIS; \
    rm -rf /build; \
    ldconfig
 
WORKDIR /tmp

# Called on first run of docker
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

# Slim down things by clearing apt cache dir, removing all dev packages etc.
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get remove `dpkg -l | grep -e \-dev | sed 's/ii//g' \
    | sed 's/rc//g' | sed 's/^ *//;s/ *$//' \
    | sed 's/ \+ /\t/g' | cut -f 1`

CMD /start.sh
