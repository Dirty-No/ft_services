#!/bin/sh -e

image="ftps"
docker build -t $image .
docker run -p 20:20 -p 21:21 -it $image