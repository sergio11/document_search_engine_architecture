FROM docker.elastic.co/logstash/logstash-oss:7.9.2

# This is a logstash plugin for pulling data out of mongodb and processing with logstash.
RUN logstash-plugin install logstash-input-mongodb 
RUN logstash-plugin install logstash-output-elasticsearch
