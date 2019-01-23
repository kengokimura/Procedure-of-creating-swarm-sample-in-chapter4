#!/bin/sh

echo "## docker container exec -it manager docker network create --driver=overlay --attachable todoapp"
docker container exec -it manager docker network create --driver=overlay --attachable todoapp
