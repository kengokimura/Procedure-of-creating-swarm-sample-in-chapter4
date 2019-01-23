#!/bin/sh

echo "-------swarm node lists--------"
echo "## docker container exec -it manager docker node list"
docker container exec -it manager docker node list

echo "------ list stacks ------"
echo "## docker container exec -it manager docker stack ls"
docker container exec -it manager docker stack ls

echo "## for f in \`docker container exec -it manager docker stack ls | awk '{print $1}' | grep -v NAME\`; do"
for f in `docker container exec -it manager docker stack ls | awk '{print $1}' | grep -v NAME`; do
    echo "--- $f ---"
    #docker container exec -it manager docker stack service {{.Name}}
    echo "## docker container exec -it manager docker stack services $f"
    docker container exec -it manager docker stack services $f
    echo ""
    echo "## docker container exec -it manager docker stack ps $f --filter desired-state=running --no-trunc"  
    docker container exec -it manager docker stack ps $f --filter desired-state=running --no-trunc  
done 
    
echo "------ list services ------"
echo "## docker container exec -it manager docker service ls"
docker container exec -it manager docker service ls

echo "------ list networks ------"
echo "## docker container exec -it manager docker network ls"
docker container exec -it manager docker network ls
