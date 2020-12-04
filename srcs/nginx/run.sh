#!/bin/sh

docker build -t nginx .
docker run -p 80:80 -p 443:443 -it nginx