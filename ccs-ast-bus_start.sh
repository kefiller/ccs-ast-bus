#!/bin/bash

# Detect where script SOURCE is located
SCRIPT_ORIGPATH=`readlink -f "$(test -L "$0" && readlink "$0" || echo "$0")"`
SCRIPT_ORIGDIR=`dirname $SCRIPT_ORIGPATH`

docker run -t --rm  -w /app \
    --name=ccs-ast-bus \
    --network=host \
    -v $SCRIPT_ORIGDIR:/app \
    -e NODE_DISABLE_COLORS=1 \
    -e PBX_NAME=`hostname -A` \
    -e AMI_HOST='localhost' \
    -e AMI_USER=api \
    -e AMI_PASSWORD='Fgbitxrf18' \
    -e LOG_LEVEL="trace" \
    node:latest node index.js $@
