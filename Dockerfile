FROM ubuntu:14.04

VOLUME ["/var/lib/unifi"]

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://www.ubnt.com/downloads/unifi/debian unifi5 ubiquiti" \
  > /etc/apt/sources.list.d/100-ubnt.list

RUN echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" \
  > /etc/apt/sources.list.d/200-mongo.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

RUN apt-get -q update && \
    apt-get install -qy --force-yes supervisor unifi && \
    apt-get -q clean && \
    rm -rf /var/lib/apt/lists/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD system.properties /usr/lib/unifi/data/system.properties

WORKDIR /var/lib/unifi

EXPOSE 80/tcp 8880/tcp 443/tcp 8843/tcp 3478/udp

CMD ["/usr/bin/supervisord"]
