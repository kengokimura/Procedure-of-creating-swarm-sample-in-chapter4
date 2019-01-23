#!/bin/sh

system=${1:-todo_app}
echo "$system"

echo "## docker container exec -it manager docker stack ps $system --filter "desired-state=running" --no-trunc --format \"docker container exec -it {{.Node}} docker container exec -it {{.Name}}.{{.ID}} /bin/bash\""
docker container exec -it manager docker stack ps $system --filter "desired-state=running" --no-trunc --format "docker container exec -it {{.Node}} docker container exec -it {{.Name}}.{{.ID}} /bin/bash"

echo 
echo "In order to check if it works, IN THE API CONTAINER you should execute the fowllowing cmd lines"
echo "                                      ~~~~~~~~~~~~~"
echo "apt-get update"
echo "apt-get install jq"
echo "curl -s -XGET http://localhost:8080/todo?status=TODO | jq . "
