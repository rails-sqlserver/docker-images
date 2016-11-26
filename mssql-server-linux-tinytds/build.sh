#!/usr/bin/env bash
set -e

image=$(docker images -q --filter label=metaskills/mssql-server-linux-tinytds)
if [[ -n $image ]]; then
  docker rmi -f $image
fi

docker build --no-cache -t metaskills/mssql-server-linux-tinytds .

container=$(docker run -p 1433:1433 -d metaskills/mssql-server-linux-tinytds)
sleep 12
docker exec $container /opt/tinytds/setup.sh
docker commit $container metaskills/mssql-server-linux-tinytds
docker push metaskills/mssql-server-linux-tinytds
docker stop $container
