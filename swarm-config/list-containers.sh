#!/bin/sh

echo "-------list containers-------"
# docker container ls | cut -d " " -f 1,2  ## couldn't use "  "(multi space) delimiter in cut command
echo "## docker container ls --format \"table {{.ID}} {{.Names}}\""
docker container ls --format "table {{.ID}} {{.Names}}"

echo "-------list containers in the swarms-------"
echo "--- manager ---"
echo "## docker container exec -it manager docker container ls"
docker container exec -it manager docker container ls
echo ""
for f in 1 2 3; do 
    echo "--- worker0$f ---"
    echo "## docker container exec -it worker0$f docker container ls"
    docker container exec -it worker0$f docker container ls 
    ### #docker container exec -it worker0$f docker container ls --format "{{.Names}}" 
    ### for e in `docker container exec -it worker0$f docker container ls --format "{{.Names}}"`; do
    ###     echo "docker container exec -it worker0$f docker container exec -it $e hostname -i"
    ###     #docker container exec -it worker0$f docker container exec -it $e hostname -i
    ###     docker container exec -it worker0$f docker container exec -it $e ls
    ### done
done

echo ""
echo "## docker container ls --format \"table {{.Ports}} {{.Names}}\""
docker container ls --format "table {{.Ports}} {{.Names}}"

echo " "
echo "### for visualising containers use the visualiser in manager node."
echo "## docker container exec -it manager docker container ls --format "table {{.Ports}} {{.Names}}""
docker container exec -it manager docker container ls --format "table {{.Ports}} {{.Names}}"
