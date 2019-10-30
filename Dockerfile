FROM ubuntu:latest

MAINTAINER Richard Kieft <richard@detesters.nl>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update -y \
    && apt-get -y --no-install-recommends install openjdk-8-jre-headless wget ca-certificates sudo lsof \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/selenium && wget --no-check-certificate -O /opt/selenium/selenium-server-standalone-3.14.0.jar \
    "https://selenium-release.storage.googleapis.com/3.14/selenium-server-standalone-3.14.0.jar"

RUN chmod +x /opt/selenium/selenium-server-standalone-3.14.0.jar

ADD grid-servlet-0.8.0.jar /opt/selenium/grid-servlet-0.8.0.jar
ADD hub_4444.json /opt/selenium/hub_4444.json

EXPOSE 30000

WORKDIR /opt/selenium/

CMD "java" "-cp" "selenium-server-standalone-3.14.0.jar:grid-servlet-0.8.0.jar" "org.openqa.grid.selenium.GridLauncherV3" "-servlets" "com.xing.qa.selenium.grid.hub.Console" "-role" "hub" "-hubConfig" "hub_4444.json"