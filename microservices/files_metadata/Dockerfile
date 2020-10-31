FROM openjdk:8-jdk-alpine
# Add Maintainer Info
LABEL description="Document Search Engine Files Metadata Service"
# Args for image
ARG PORT=8080

RUN apk update && apk upgrade
RUN ln -s /bin/bash /usr/bin
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app


COPY resources/wait-for-it.sh  wait-for-it.sh
COPY target/file_metadata_service.jar app.jar

RUN dos2unix wait-for-it.sh
RUN chmod +x wait-for-it.sh
RUN uname -a
RUN pwd
RUN ls -al

EXPOSE ${PORT}

CMD ["sh", "-c", "echo 'waiting for 300 seconds for consul-agent:8500 to be accessable before starting application' && ./wait-for-it.sh -t 300 consul:8500 -- java -jar app.jar"]