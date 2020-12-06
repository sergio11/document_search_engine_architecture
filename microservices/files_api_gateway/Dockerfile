FROM ubuntu

# Add Maintainer Info
LABEL description="Document Search Engine API Gateway Service"

RUN apt-get update \
    && apt-get install -y firefox \
                      openssh-server \
                      xauth \
    && mkdir /var/run/sshd \
    && mkdir /root/.ssh \
    && chmod 700 /root/.ssh \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i "s/^.*X11Forwarding.*$/X11Forwarding yes/" /etc/ssh/sshd_config \
    && sed -i "s/^.*X11UseLocalhost.*$/X11UseLocalhost no/" /etc/ssh/sshd_config \
    && grep "^X11UseLocalhost" /etc/ssh/sshd_config || echo "X11UseLocalhost no" >> /etc/ssh/sshd_config

RUN echo 'root:ssanchez00' | chpasswd
RUN echo "ssanchezpc" > /etc/hostname

## Install OpenJDK 8
RUN apt-get install -y --no-install-recommends software-properties-common
RUN add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y openjdk-8-jre
RUN update-alternatives --config java
RUN update-alternatives --config javac

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY resources/wait-for-it.sh  wait-for-it.sh
COPY target/files_api_gateway_service.jar app.jar


RUN apt-get install -y dos2unix
RUN dos2unix wait-for-it.sh
RUN chmod +x wait-for-it.sh
RUN uname -a
RUN pwd
RUN ls -al


EXPOSE 22

ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && echo 'waiting for 300 seconds for consul-server:8500 to be accessable before starting application' && ./wait-for-it.sh -t 300 consul:8500 -- java -jar app.jar && tail -f /dev/null"]