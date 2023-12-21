#! /bin/bash

# get the running container name
running_container=$(docker ps --format '{{.Names}}'  --filter=status=running)

# stop the running container

if [ -n "$running_container" ]; then

    docker stop $running_container
fi
