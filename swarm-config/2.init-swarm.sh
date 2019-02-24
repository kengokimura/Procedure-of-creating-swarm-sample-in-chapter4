#!/bin/bash

usage_exit() {
     echo "Usage: $0 [-i|-s]"
     exit 1
}

TOKEN=
FALG=false

while getopts is option
do
  case $option in
    i)
      echo '-i option. Initializing the swarm and join worker nodes...'
      echo "## docker container exec -it manager docker swarm init"
      docker container exec -it manager docker swarm init
      echo " please input the manager's TOKEN.(To get the token specify -s option before you use -i option.)"
      read TOKEN
      echo "## docker container exec -it worker01 docker swarm join --token $TOKEN manager:2377"
      docker container exec -it worker01 docker swarm join --token $TOKEN manager:2377
      echo "## docker container exec -it worker02 docker swarm join --token $TOKEN manager:2377"
      docker container exec -it worker02 docker swarm join --token $TOKEN manager:2377
      echo "## docker container exec -it worker03 docker swarm join --token $TOKEN manager:2377"
      docker container exec -it worker03 docker swarm join --token $TOKEN manager:2377
      echo "## docker container exec -it manager docker stack deploy -c /stack/visualizer.yml visualizer"
      docker container exec -it manager docker stack deploy -c /stack/visualizer.yml visualizer
      FLAG=true;;
    s)
      echo '-s option. The token is as follows...'
      echo "## docker container exec -it manager docker swarm join-token manager"
      docker container exec -it manager docker swarm join-token manager
      FLAG=true;;
    \?)
      usage_exit
      ;;
    esac
done

if [ -z $FLAG  ]; then
   usage_exit
fi

echo
echo "checking if other options are spcefied..."
echo "## shift \`expr \"$OPTIND\" - 1\`"
shift `expr "$OPTIND" - 1`
if [ $# -ge 1 ]; then
  echo 'other options are '"$@"''
else
  echo 'no other options'
fi

