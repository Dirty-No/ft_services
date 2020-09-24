#!/bin/sh -e

image="wordpress"
docker build -t $image .
docker run -p 80:80 -p 443:443 -it $image