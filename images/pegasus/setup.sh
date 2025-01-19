#!/bin/bash

export SHA="sha-0d7f3d3"
# export BASE_APP_IMAGE="ghcr.io/games-on-whales/base-emu:${SHA}"
# export BASE_EMU_IMAGE=gow/base-emu:${SHA}

echo $BASE_EMU_IMAGE

docker build -t gow/pegasus:${SHA} --build-arg="BASE_EMU_IMAGE=${BASE_EMU_IMAGE}" .


