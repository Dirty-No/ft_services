#!/bin/sh -e

image="grafana"
docker build -t $image .
docker run -p 3000:3000 -it $image