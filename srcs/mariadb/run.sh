#!/bin/sh -e

image="mariadb-image"
docker build -t $image .
#docker run -it -p 3306:3306 $image