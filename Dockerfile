FROM maven:3-jdk-8-alpine

RUN mkdir /app
WORKDIR /app

COPY settings.xml /usr/share/maven/ref/
COPY pom.xml /tmp/pom.xml

COPY . /app

RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings-docker.xml   prepare-package -DskipTests