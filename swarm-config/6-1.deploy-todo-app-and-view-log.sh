#!/bin/sh

# deploy todo-app
echo "## docker container exec -it manager docker stack deploy -c /stack/todo-app.yml todo_app"
docker container exec -it manager docker stack deploy -c /stack/todo-app.yml todo_app

# get status of todo_api container
echo "## docker container exec -it manager docker service logs -f todo_app_api"
docker container exec -it manager docker service logs -f todo_app_api
