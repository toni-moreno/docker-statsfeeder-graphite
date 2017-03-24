FROM openjdk:alpine
MAINTAINER Toni Moreno <toni.moreno@gmail.com>

RUN mkdir /statsfeeder

ADD statsfeeder/ /statsfeeder/

RUN mkdir /statsfeeder/logs

VOLUME ["/statsfeeder/config", "/statsfeeder/logs"]


COPY ./statsfeeder-GraphiteReceiver-1.0-IPM-4.0.jar /statsfeeder/lib
COPY ./ConfigOutGraphite.conf /statsfeeder/config/
COPY ./log4j.properties /statsfeeder/config/
COPY ./vcenter.conf /statsfeeder/config/
COPY ./rules.xml /statsfeeder/config/
COPY ./hostname.map /statsfeeder/config/
COPY ./start.sh /

WORKDIR /statsfeeder

ENTRYPOINT ["/start.sh"]
