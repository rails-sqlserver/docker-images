#!/usr/bin/env bash
set -e

image=$(docker ps --all --quiet --filter ancestor=metaskills/mssql-server-linux-rails)
if [[ -n $image ]]; then
  docker rmi -f $image
fi

docker build --no-cache -t metaskills/mssql-server-linux-rails .

container=$(docker run -p 1433:1433 -d metaskills/mssql-server-linux-rails)
sleep 12
docker exec $container /opt/rails/setup.sh
docker commit $container metaskills/mssql-server-linux-rails
docker push metaskills/mssql-server-linux-rails
docker stop $container
