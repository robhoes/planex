#!/bin/sh -xe

echo $@
[ -v $EXTUID ] || usermod -u $EXTUID build
[ -v $EXTGID ] || groupmod -g $EXTGID build
su - build -c "$*"
