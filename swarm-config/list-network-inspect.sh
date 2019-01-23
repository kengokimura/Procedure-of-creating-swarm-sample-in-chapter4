#!/bin/sh

echo "## docker container exec -it manager docker network inspect todoapp"
docker container exec -it manager docker network inspect todoapp

for f in `seq 1 3`; do
    echo "--- worker0$f ---"
    echo "## docker container exec -it worker0$f docker network inspect todoapp"
    docker container exec -it worker0$f docker network inspect todoapp
done
