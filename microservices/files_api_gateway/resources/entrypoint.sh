#!/bin/sh

echo "starting ssh as root"
service ssh start && service ssh status

cd /usr/src/app
echo 'waiting for 300 seconds for consul-server:8500 to be accessable before starting application'
./wait-for-it.sh -t 300 consul:8500 -- java -jar app.jar