#!/bin/sh

echo "## docker container exec -it manager docker stack deploy -c /stack/todo-mysql.yml todo_mysql"
docker container exec -it manager docker stack deploy -c /stack/todo-mysql.yml todo_mysql
