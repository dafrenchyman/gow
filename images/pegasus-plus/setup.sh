#!/bin/bash

# Set the SHA
# export SHA="sha-0d7f3d3" # old working
# export SHA="sha-518a3b4" # current worknig
export SHA="sha-518a3b4" # testing

export PEGASUS_BASE_APP_IMAGE="ghcr.io/games-on-whales/pegasus:${SHA}"
# export PEGASUS_BASE_APP_IMAGE="gow/pegasus:${SHA}"

echo $PEGASUS_BASE_APP_IMAGE

docker build -t gow/pegasus-plus:${SHA} --build-arg="PEGASUS_BASE_APP_IMAGE=${PEGASUS_BASE_APP_IMAGE}" .
