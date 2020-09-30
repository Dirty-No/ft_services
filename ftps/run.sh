#!/bin/sh -e

image="cripplingdepression"
docker build -t $image .
docker run -p 20:20 -p 21:21 -p 25565:25565 -it $image