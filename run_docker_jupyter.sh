#!/usr/bin/env bash

PORT=${1}

docker run -ti \
    -p ${PORT}:8888 \
    -v /allen/aics/modeling/${USER}/projects:/root/projects \
    -v /allen/aics:/root/aics \
    rorydm/r_rnaseq

