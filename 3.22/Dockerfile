FROM qgis/qgis3-build-deps-22.04-qt5:latest

MAINTAINER Samweli Mwakisambwe<samweli@kartoza.com>
# Based off work by Denis Rouzaud <denis.rouzaud@gmail.com>

ENV CC=/usr/lib/ccache/clang
ENV CXX=/usr/lib/ccache/clang++
ENV QT_SELECT=5

COPY build /build/scripts

RUN /build/scripts/getCode.sh && \
    /build/scripts/make.sh && \
    /build/scripts/clean.sh


ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
