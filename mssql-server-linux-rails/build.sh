#!/usr/bin/env bash
set -e

images=$(docker images --all --quiet)
if [[ -n $images ]]; then
  docker rmi --force $images
fi

docker pull microsoft/mssql-server-linux:latest
docker build --no-cache -t metaskills/mssql-server-linux-rails .

container=$(docker run -p 1433:1433 -d metaskills/mssql-server-linux-rails)
sleep 12
docker exec $container /opt/rails/setup.sh
docker commit $container metaskills/mssql-server-linux-rails
docker tag metaskills/mssql-server-linux-rails metaskills/mssql-server-linux-rails:1.1
docker push metaskills/mssql-server-linux-rails:1.1
docker push metaskills/mssql-server-linux-rails
docker stop $container
