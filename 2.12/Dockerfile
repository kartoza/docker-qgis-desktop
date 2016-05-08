FROM kartoza/qgis-base:v2
MAINTAINER Tim Sutton<tim@kartoza.com>

# Clone the master branch
RUN git clone --depth 1 -b release-2_12 git://github.com/qgis/QGIS.git; \
    mkdir /build; \
    cd /build; \
        cmake /QGIS \
        -DQWT_INCLUDE_DIR=/usr/include/qwt \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython2.7.so \
        -DQSCINTILLA_INCLUDE_DIR=/usr/include/qt4 \
        -DQWT_LIBRARY=/usr/lib/libqwt.so \
        -DWITH_SERVER=ON \
        -DBUILD_TESTING=OFF \
        -DWITH_INTERNAL_QWTPOLAR=ON; \
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
