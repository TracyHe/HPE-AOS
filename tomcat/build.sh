#!/bin/bash
./clean.sh
docker rmi tom
docker build -t flynn/tom .
