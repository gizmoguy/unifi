FROM ubuntu:14.04

VOLUME ["/var/lib/unifi"]

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti" \
  > /etc/apt/sources.list.d/ubiquiti.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50

RUN apt-get -q update && \
    apt-get install -qy --force-yes supervisor unifi && \
    apt-get -q clean && \
    rm -rf /var/lib/apt/lists/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD system.properties /var/lib/unifi/system.properties

WORKDIR /var/lib/unifi

EXPOSE 80/tcp 8880/tcp 443/tcp 8843/tcp 3478/udp

CMD ["/usr/bin/supervisord"]
