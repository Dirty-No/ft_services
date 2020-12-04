#!/bin/sh -e

image="my_influxdb"
docker build -t $image .
docker run -p 8086:8086 -it $image