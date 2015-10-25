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


RUN apt-get -y install binutils bison bsdmainutils build-essential bzip2 cmake cmake-data comerr-dev cpp cpp-4.9 debhelper doxygen dpkg-dev fakeroot file flex \
  fontconfig fontconfig-config fonts-dejavu-core g++ g++-4.9 gcc gcc-4.9 gettext gettext-base git git-man graphviz grass-core grass-dev \
  groff-base hdf5-helpers icu-devtools init-system-helpers intltool-debian iso-codes krb5-multidev libarchive13 libarmadillo4 libarpack2 \
  libasan1 libasn1-8-heimdal libasound2 libasound2-data libasprintf0c2 libasyncns0 libatomic1 libaudio2 libavahi-client3 libavahi-common-data \
  libavahi-common3 libavcodec56 libavdevice55 libavformat56 libavresample2 libavutil54 libbison-dev libblas-common libblas3 libbluray1 \
  libbsd0 libc-dev-bin libc6-dev libcairo2 libcdio-cdda1 libcdio-paranoia1 libcdio13 libcdt5 libcf0 libcgraph6 libcilkrts5 libclang1-3.5 \
  libcloog-isl4 libcoin80 libcroco3 libcups2 libcurl3 libcurl3-gnutls libcurl4-gnutls-dev libdap-dev libdap11 libdapclient3 libdapserver7 \
  libdatrie1 libdbus-1-3 libdc1394-22 libdpkg-perl libdrm-dev libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libedit2 libepsilon1 \
  liberror-perl libexpat1 libexpat1-dev libfaad2 libfakeroot libfam0 libfcgi-dev libfcgi0ldbl libffi6 libfftw3-double3 libfl-dev libflac8 \
  libfontconfig1 libfontenc1 libfreetype6 libfreetype6-dev libfreexl1 libgcc-4.9-dev libgd3 libgdal-dev libgdal1-dev libgdal1h libgdbm3 \
  libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgeos-3.4.2 libgeos-c1 libgeos-dev libgfortran3 libgif-dev libgif4 libgl1-mesa-dev \
  libgl1-mesa-glx libglapi-mesa libglib2.0-0 libglu1-mesa libglu1-mesa-dev libgmp10 libgnutls-deb0-28 libgomp1 libgraphicsmagick3 \
  libgraphite2-3 libgsl0-dev libgsl0ldbl libgsm1 libgssapi-krb5-2 libgssapi3-heimdal libgssrpc4 libgstreamer-plugins-base1.0-0 \
  libgstreamer1.0-0 libgvc6 libgvpr2 libharfbuzz0b libhcrypto4-heimdal libhdf4-0-alt libhdf4-alt-dev libhdf5-8 libhdf5-cpp-8 libhdf5-dev \
  libheimbase1-heimdal libheimntlm0-heimdal libhogweed2 libhx509-5-heimdal libice6 libicu-dev libicu52 libidn11 libisl10 libiso9660-8 libitm1 \
  libjack-jackd2-0 libjasper-dev libjasper1 libjbig0 libjpeg-dev libjpeg62-turbo libjpeg62-turbo-dev libjs-jquery libjson-c2 libk5crypto3 \
  libkadm5clnt-mit9 libkadm5srv-mit9 libkdb5-7 libkeyutils1 libkml0 libkrb5-26-heimdal libkrb5-3 libkrb5support0 liblapack3 liblcms2-2 \
  libldap-2.4-2 libldb1 libllvm3.5 liblsan0 libltdl-dev libltdl7 liblzo2-2 libmad0 libmagic1 libmng1 libmodplug1 libmp3lame0 libmpc3 \
  libmpcdec6 libmpfr4 libmysqlclient-dev libmysqlclient18 libnetcdf-dev libnetcdfc++4 libnetcdfc7 libnetcdff5 libnettle4 libntdb1 \
  libobjc-4.9-dev libobjc4 libodbc1 libogdi3.2 libogg0 libopenjpeg5 libopenscenegraph-dev libopenscenegraph100 libopenthreads-dev \
  libopenthreads20 libopus0 liborc-0.4-0 libosgearth-dev libosgearth3 libosgearthannotation3 libosgearthfeatures3 libosgearthqt3 \
  libosgearthsymbology3 libosgearthutil3 libp11-kit0 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpathplan4 libpciaccess0 \
  libpipeline1 libpixman-1-0 libpng12-0 libpng12-dev libpoppler-glib8 libpoppler46 libpopt0 libpostproc52 libpq-dev libpq5 libproj-dev \
  libproj0 libpthread-stubs0-dev libpulse0 libpython-dev libpython-stdlib libpython2.7 libpython2.7-dev libpython2.7-minimal \
  libpython2.7-stdlib libqscintilla2-11 libqscintilla2-dev libqscintilla2-l10n libqt4-dbus libqt4-declarative libqt4-designer libqt4-dev \
  libqt4-dev-bin libqt4-help libqt4-network libqt4-opengl libqt4-opengl-dev libqt4-qt3support libqt4-script libqt4-scripttools libqt4-sql \
  libqt4-sql-sqlite libqt4-svg libqt4-test libqt4-xml libqt4-xmlpatterns libqtassistantclient4 libqtcore4 libqtdbus4 libqtgui4 \
  libqtwebkit-dev libqtwebkit4 libquadmath0 libqwt-dev libqwt6 libraw1394-11 libroken18-heimdal librsvg2-2 librtmp1 libsamplerate0 libsasl2-2 \
  libsasl2-modules-db libschroedinger-1.0-0 libsigsegv2 libsm6 libsmbclient libsndfile1 libspatialindex-c3 libspatialindex-dev \
  libspatialindex3 libspatialite-dev libspatialite5 libspeex1 libsqlite3-0 libsqlite3-dev libssh2-1 libssl-dev libssl1.0.0 libstdc++-4.9-dev \
  libswscale3 libtalloc2 libtasn1-6 libtdb1 libterm-readkey-perl libterm-readline-perl-perl libtevent0 libthai-data libthai0 libtheora0 \
  libtiff5 libtimedate-perl libtsan0 libubsan0 libunistring0 liburiparser1 libusb-1.0-0 libv4l-0 libv4lconvert0 libva1 libvcdinfo0 \
  libvorbis0a libvorbisenc2 libvpx1 libwavpack1 libwbclient0 libwebp-dev libwebp5 libwebpdemux1 libwebpmux1 libwind0-heimdal libwmf0.2-7 \
  libwrap0 libx11-6 libx11-data libx11-dev libx11-xcb-dev libx11-xcb1 libx264-142 libxapian22 libxau-dev libxau6 libxaw7 libxcb-dri2-0 \
  libxcb-dri2-0-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev libxcb-present-dev libxcb-present0 libxcb-randr0 \
  libxcb-randr0-dev libxcb-render0 libxcb-render0-dev libxcb-shape0 libxcb-shape0-dev libxcb-shm0 libxcb-sync-dev libxcb-sync1 libxcb-xfixes0 \
  libxcb-xfixes0-dev libxcb1 libxcb1-dev libxdamage-dev libxdamage1 libxdmcp-dev libxdmcp6 libxdot4 libxerces-c-dev libxerces-c3.1 \
  libxext-dev libxext6 libxfixes-dev libxfixes3 libxfont1 libxi6 libxine2 libxine2-bin libxine2-ffmpeg libxine2-misc-plugins libxine2-plugins \
  libxkbfile1 libxml2 libxml2-dev libxmu6 libxmuu1 libxpm4 libxrender1 libxshmfence-dev libxshmfence1 libxt6 libxtst6 libxvidcore4 \
  libxxf86vm-dev libxxf86vm1 lighttpd linux-libc-dev locales m4 make man-db mesa-common-dev mime-support mysql-common odbcinst \
  odbcinst1debian2 patch perl perl-modules pkg-config po-debconf poppler-utils proj-data pyqt4-dev-tools python python-dev python-minimal \
  python-numpy python-qscintilla2 python-qt4 python-qt4-dev python-sip python-sip-dev python-talloc python2.7 python2.7-dev python2.7-minimal \
  qdbus qt4-doc-html qt4-linguist-tools qt4-qmake qtchooser qtcore4-l10n samba-libs sip-dev spawn-fcgi txt2tags ucf unixodbc unixodbc-dev \
  uuid-dev x11-common x11-xkb-utils x11proto-core-dev x11proto-damage-dev x11proto-dri2-dev x11proto-fixes-dev x11proto-gl-dev \
  x11proto-input-dev x11proto-kb-dev x11proto-xext-dev x11proto-xf86vidmode-dev xauth xfonts-100dpi xfonts-75dpi xfonts-base xfonts-encodings \
  xfonts-scalable xfonts-utils xkb-data xorg-sgml-doctools xserver-common xtrans-dev xvfb xz-utils zlib1g-dev \
  apache2 libapache2-mod-fcgid \
  libqca2-dev libqca2 libqca2-plugin-ossl

RUN chmod -R a+w /usr/lib/x86_64-linux-gnu/qt4/plugins/designer/
RUN chmod -R a+w /usr/lib/python2.7/dist-packages/PyQt4/uic/widget-plugins/

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
