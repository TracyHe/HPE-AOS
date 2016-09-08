#!/bin/bash
./clean.sh

docker build -t flynn/db .
