#!/bin/bash

docker run -d -p 8087:8080 --name tom -e DB_HOST=db -e TOMCAT_HOST=tom -e TOMCAT_PORT=8087 --net demo-net --ip=172.50.1.51 flynn/tom
