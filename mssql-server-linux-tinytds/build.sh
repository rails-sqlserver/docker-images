#!/usr/bin/env bash
set -e

tag=2.0

images=$(docker images --all --quiet)
if [[ -n $images ]]; then
  docker rmi --force $images
fi

docker pull microsoft/mssql-server-linux:latest
docker build --no-cache -t metaskills/mssql-server-linux-tinytds .

docker run -p 1433:1433 -d metaskills/mssql-server-linux-tinytds
sleep 15
container=$(docker ps --all --quiet --filter ancestor=metaskills/mssql-server-linux-tinytds)

docker exec $container /opt/tinytds/setup.sh
docker commit $container metaskills/mssql-server-linux-tinytds
docker tag metaskills/mssql-server-linux-tinytds metaskills/mssql-server-linux-tinytds:$tag
docker push metaskills/mssql-server-linux-tinytds:$tag
docker push metaskills/mssql-server-linux-tinytds
docker stop $container
