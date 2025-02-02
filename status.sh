#!/bin/bash

SERVICE=phz-pgvector
#vagrant status
if test "$1" == 'stg' || test "$1" == 'prod'; then
    export DOCKER_HOST=docker-swarm-master.in.phz.fi
    docker stack ps $SERVICE-$1
else
    export DOCKER_HOST=
    docker compose ps
fi
