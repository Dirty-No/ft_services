#!/bin/sh -e

image="wordpress"
docker build -t $image .
docker run -p 5050:5050 -p 80:80 -it  $image