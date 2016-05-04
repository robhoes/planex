#!/bin/sh

docker create \
  --name planex-persist \
  -v /var/cache/mock \
  -v /var/cache/yum \
  planex-release:0.7.3 /bin/true

docker run \
  --privileged \
  --rm -i -t \
  --volumes-from planex-persist \
  -v ${PWD}:/build \
  -e EXTUID=$(id -u) -e EXTGID=$(id -g) \
  planex-release:0.7.3 "$*"
