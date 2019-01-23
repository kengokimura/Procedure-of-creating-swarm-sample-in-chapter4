#!/bin/sh

echo "### Be sure to login docker before this script execution ###"
for f in tododb todoapi todonginx todoweb nginx-nuxt; do
    if [ $f = "nginx-nuxt" ]; then
        echo "## cd ../todonginx/"
        cd ../todonginx/
        DOCKERFILE_OPT=" -f Dockerfile-nuxt "
    else 
        echo "## cd ../$f/"
        cd ../$f/
    fi

    echo "## docker image build $DOCKERFILE_OPT -t ch04/$f:latest ."
    docker image build $DOCKERFILE_OPT -t ch04/$f:latest .
    echo "## docker image build -t ch04/$f:latest ."
    docker image build -t ch04/$f:latest .
    echo "## docker image tag ch04/$f:latest localhost:5000/ch04/$f:latest"
    docker image tag ch04/$f:latest localhost:5000/ch04/$f:latest
    echo "## docker image push localhost:5000/ch04/$f:latest"
    docker image push localhost:5000/ch04/$f:latest
done
