#!/bin/sh

# deploy todo-ingress
echo "## docker container exec -it manager docker stack deploy -c /stack/todo-ingress.yml todo_ingress"
docker container exec -it manager docker stack deploy -c /stack/todo-ingress.yml todo_ingress

