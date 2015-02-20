#--------- Generic stuff all our Dockerfiles should start with so we get caching ------------
FROM fedora:21
MAINTAINER Tim Sutton<tim@kartoza.com>

RUN yum -y update

# Yum-utils provides yum-builddep command
RUN yum install -y yum-utils; yum-builddep -y qgis; yum install -y \
     gdal.x86_64 \
     gdal-python.x86_64 \
     python-psycopg2.x86_64 \
     grass-devel.x86_64 \
     qscintilla-python.x86_64 \
     qscintilla-devel.x86_64 \
     qscintilla.x86_64 PyQt4-qsci-api.x86_64 \
     git \
     gcc \
     gcc-c++ \
     make \
     automake \
     meld

WORKDIR /tmp
RUN yum install -y wget; \
    wget http://corefonts.sourceforge.net/msttcorefonts-2.5-1.spec; \
    yum install -y rpm-build cabextract ttmkfdir
RUN rpmbuild -bb msttcorefonts-2.5-1.spec
RUN yum install -y /root/rpmbuild/RPMS/noarch/msttcorefonts-2.5-1.noarch.rpm


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
