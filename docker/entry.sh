#!/bin/sh -xe

echo $@
usermod -u $EXTUID build
groupmod -g $EXTGID build
su - build -c "$*"
