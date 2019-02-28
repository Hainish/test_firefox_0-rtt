FROM debian:stretch

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    tcpdump \
    ca-certificates \
    bzip2 \
    libdbus-glib-1-2 \
    libgtk-3-0 \
    libxt6 \
    curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

WORKDIR /opt
RUN mkdir packet_dump
RUN curl -sLo firefox.tar.bz2 'https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US'
RUN tar -jxf firefox.tar.bz2

ADD entrypoint.sh .

ENTRYPOINT ["/opt/entrypoint.sh"]
