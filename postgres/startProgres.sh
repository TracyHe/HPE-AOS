#!/bin/bash

docker run -d --name db --net demo-net --ip=172.50.1.50 -d -e POSTGRES_Password=Password1 -p 5432:5432 -e POSTGRES_USER=admin -v /tmp/postgresql/data:/var/lib/postgresql/data flynn/db 

