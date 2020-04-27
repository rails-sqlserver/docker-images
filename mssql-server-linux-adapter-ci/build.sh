#!/usr/bin/env bash
set -e

TARGET_VERSION=${1:-'2.7.1'}

images=$(docker images --all --quiet)
if [[ -n $images ]]; then
  docker rmi --force $images
fi

docker build --no-cache --build-arg TARGET_VERSION=${TARGET_VERSION} --tag railssqlserver/activerecord-sqlserver-adapter:${TARGET_VERSION} .
docker push railssqlserver/activerecord-sqlserver-adapter:${TARGET_VERSION}
