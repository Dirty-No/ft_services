#!/bin/sh -e

image="phpmyadmin"
docker build -t $image .
docker run -p 8080:8080 -it $image