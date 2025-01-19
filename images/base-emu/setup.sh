#!/bin/bash

export SHA="sha-0d7f3d3"
export BASE_APP_IMAGE="ghcr.io/games-on-whales/base-app:${SHA}"

echo $BASE_APP_IMAGE

docker build -t gow/base-emu:${SHA} --build-arg="BASE_APP_IMAGE=${BASE_APP_IMAGE}" .


