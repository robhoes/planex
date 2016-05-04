#!/bin/sh

docker run \
  --privileged \
  --rm -i -t \
  -v ${PWD}:/build \
  -e EXTUID=$(id -u) -e EXTGID=$(id -g) \
  planex-release "$*"
