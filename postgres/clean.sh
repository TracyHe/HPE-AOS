#!/bin/bash

docker stop db
docker rm db
rm -rf /tmp/postgresql
