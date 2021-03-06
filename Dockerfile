# KUDOS TO Thomas Kerpe <thomas@kerpe.net>

FROM debian:stable

MAINTAINER Martin Betak <matobet@gmail.com>


RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget

RUN wget -O - http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | apt-key add -
RUN wget -O /etc/apt/sources.list.d/mosquitto-repo.list http://repo.mosquitto.org/debian/mosquitto-repo.list
RUN apt-get update && apt-get install -y mosquitto

RUN adduser --system --disabled-password --disabled-login mosquitto

COPY config /mqtt/config
VOLUME ["/mqtt/config", "/mqtt/data", "/mqtt/log"]


EXPOSE 1883
CMD /usr/sbin/mosquitto -c /mqtt/config/mosquitto.conf

