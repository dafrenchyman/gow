#!/bin/bash

# Set the SHA
export SHA="sha-0d7f3d3"

export PEGASUS_BASE_APP_IMAGE="ghcr.io/games-on-whales/pegasus:${SHA}"
# export PEGASUS_BASE_APP_IMAGE="gow/pegasus:${SHA}"

echo $PEGASUS_BASE_APP_IMAGE

docker build -t gow/pegasus-plus:${SHA} --build-arg="PEGASUS_BASE_APP_IMAGE=${PEGASUS_BASE_APP_IMAGE}" .


