#!/bin/sh -e

image="my_ftps"
docker build -t $image .
docker run -p 2727:2727 -it $image