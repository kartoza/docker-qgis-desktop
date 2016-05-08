FROM kartoza/qgis-base:v2
MAINTAINER Tim Sutton<tim@kartoza.com>

# Clone the 2.6 branch
RUN git clone --depth 1 -b final-2_6_1 git://github.com/qgis/QGIS.git; \
    mkdir /build; \
    cd /build; \
    cmake /QGIS -DQWT_INCLUDE_DIR=/usr/include/qwt -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_LIBRARY=/usr/lib64/libpython2.7.so -DQSCINTILLA_INCLUDE_DIR=/usr/include/qt4 -DQWT_LIBRARY=/usr/lib/libqwt.so -DGRASS_INCLUDE_DIR=/usr/include -DWITH_INTERNAL_QWTPOLAR=OFF -DQSCINTILLA_INCLUDE_DIR=/usr/include/ -DQWT_LIBRARY=/usr/lib64/libqwt.so; \
    make install -j8; \
    cd /; \
    rm -rf /QGIS; \
    rm -rf /build; \
    ldconfig
 
# Called on first run of docker
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

CMD /start.sh
