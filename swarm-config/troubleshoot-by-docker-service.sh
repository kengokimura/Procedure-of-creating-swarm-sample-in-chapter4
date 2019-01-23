#!/bin/sh


echo "## docker container exec -it manager docker service ls --format \"docker container exec -it manager docker service logs {{.Name}}\""
echo
docker container exec -it manager docker service ls --format "docker container exec -it manager docker service logs {{.Name}}"
