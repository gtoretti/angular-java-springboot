FROM openjdk:8u212-jdk-alpine3.9

RUN mkdir /opt/microservices/
RUN mkdir /opt/microservices/logs/

ADD build/libs/cearbac-0.1.jar /opt/microservices/
ADD src/main/resources/application.properties /opt/microservices/
ADD src/main/resources/log4j2.xml /opt/microservices/
RUN adduser -D docker
RUN chown docker:docker /opt/microservices/logs/
RUN mkdir -p opt/microservices/log && \
    mkdir -p /opt/service/log && \
    chown -R docker.docker /opt/microservices/ &&\
    chmod -R 775 /opt/microservices/


EXPOSE 5000
WORKDIR /opt/microservices

USER docker

ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]