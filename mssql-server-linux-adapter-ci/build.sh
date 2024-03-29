#!/usr/bin/env bash
set -e

TARGET_VERSION=${1:-'3.3.0'}

images=$(docker images --all --quiet)
if [[ -n $images ]]; then
  docker rmi --force $images
fi

docker buildx build --platform linux/amd64,linux/arm64 --no-cache --build-arg TARGET_VERSION=${TARGET_VERSION} --tag ghcr.io/rails-sqlserver/activerecord-sqlserver-adapter:${TARGET_VERSION} .
docker push ghcr.io/rails-sqlserver/activerecord-sqlserver-adapter:${TARGET_VERSION}
