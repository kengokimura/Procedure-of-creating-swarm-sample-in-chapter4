#!/bin/sh

STACK=todo_mysql
SERVICE=todo_mysql_master

#echo "--- get service name in docker swarm ---"
#echo "## docker container exec -it manager docker service ls"
#docker container exec -it manager docker service ls

echo "--- get stack name in docker swarm ---"
echo "## docker container exec -it manager docker stack ls"
docker container exec -it manager docker stack ls

echo "--- The example of getting the 'Node (where a container is being executed)', 'Name' and 'ID' in docker swarm with 'docker stack ps' command---"
echo "## docker container exec -it manager docker stack ps $STACK --filter desired-state=running"
docker container exec -it manager docker stack ps $STACK --filter desired-state=running

echo "--- The example of getting cmmaamd line including where the container is ---"
echo "## docker container exec -it manager docker service ps --no-trunc $SERVICE --filter \"desired-state=running\" --format \"docker container exec -it {{.Node}} docker container exec -it {{.Name}}.{{.ID}} bash\""
docker container exec -it manager docker service ps --no-trunc $SERVICE --filter "desired-state=running" --format "docker container exec -it {{.Node}} docker container exec -it {{.Name}}.{{.ID}} bash"
