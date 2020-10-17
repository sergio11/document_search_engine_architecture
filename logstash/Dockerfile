FROM docker.elastic.co/logstash/logstash:7.9.2

RUN mkdir /usr/share/logstash/drivers
COPY ./drivers/* /usr/share/logstash/drivers/

# Plugins
RUN logstash-plugin install logstash-integration-jdbc
RUN logstash-plugin install logstash-output-elasticsearch
