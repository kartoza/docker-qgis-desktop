FROM ubuntu:16.04
MAINTAINER Tim Sutton<tim@kartoza.com>
# Based off work by Patrick Valsecchi<patrick.valsecchi@camptocamp.com>

ENV LANG C

COPY build /build/scripts
RUN /build/scripts/getDeps.sh && \
    /build/scripts/getCode.sh && \
    /build/scripts/make.sh && \
    /build/scripts/clean.sh

CMD ["/start.sh"]

