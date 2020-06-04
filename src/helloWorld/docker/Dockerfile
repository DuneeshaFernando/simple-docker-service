FROM openjdk:8

LABEL maintainer="dev@ballerina.io"

WORKDIR /mnt
COPY target/bin/helloWorld.jar /mnt
COPY ballerina.conf /mnt

EXPOSE 9090
CMD java -jar /mnt/helloWorld.jar