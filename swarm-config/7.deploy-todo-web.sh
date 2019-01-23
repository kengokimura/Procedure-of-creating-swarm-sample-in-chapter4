#!/bin/sh

# deploy todo-web
echo "## docker container exec -it manager docker stack deploy -c /stack/todo-frontend.yml todo_frontend"
docker container exec -it manager docker stack deploy -c /stack/todo-frontend.yml todo_frontend

