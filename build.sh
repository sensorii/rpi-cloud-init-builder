#!/bin/bash -ex

docker run --rm --privileged multiarch/qemu-user-static:register --reset
docker-compose build
docker-compose run --rm rpi-cloud-init-builder
