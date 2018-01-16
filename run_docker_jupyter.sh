#!/usr/bin/env bash

PORT=${1}

docker run -ti \
    -p ${PORT}:8888 \
    -v /allen/aics/modeling/${USER}/projects:/home/jovyan/projects \
    -v /allen/aics:/home/jovyan/aics \
    rorydm/r_rnaseq

