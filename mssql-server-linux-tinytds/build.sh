#!/usr/bin/env bash
set -e

image=$(docker ps --all --quiet --filter ancestor=metaskills/mssql-server-linux-tinytds)
if [[ -n $image ]]; then
  docker stop $image
  docker rmi -f $image
fi

images=$(docker images --all --quiet metaskills/mssql-server-linux-tinytds)
if [[ -n $images ]]; then
  docker rmi -f $images
fi

images=$(docker images --all --quiet microsoft/mssql-server-linux)
if [[ -n $images ]]; then
  docker rmi -f $images
fi

docker pull microsoft/mssql-server-linux:latest
docker build --no-cache -t metaskills/mssql-server-linux-tinytds .

container=$(docker run -p 1433:1433 -d metaskills/mssql-server-linux-tinytds)
sleep 12
docker exec $container /opt/tinytds/setup.sh
docker commit $container metaskills/mssql-server-linux-tinytds
docker tag metaskills/mssql-server-linux-tinytds metaskills/mssql-server-linux-tinytds:1.1
docker push metaskills/mssql-server-linux-tinytds:1.1
docker push metaskills/mssql-server-linux-tinytds
docker stop $container
