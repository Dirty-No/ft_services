#!/bin/sh -e

image="phpmyadmin"
docker build -t $image .
docker run -p 5000:5000 -it $image