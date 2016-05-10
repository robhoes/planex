#!/bin/sh

docker build -t planex-release:0.7.3 -f Dockerfile.release .
docker build -t planex-unstable -f Dockerfile.unstable .
docker build -t planex-master -f Dockerfile.master .


