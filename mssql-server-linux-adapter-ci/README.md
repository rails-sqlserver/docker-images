
## mssql-server-linux-adapter-ci

Using the official images for ruby.

* https://hub.docker.com/_/ruby
* https://github.com/rails-sqlserver/docker-images
* https://github.com/rails-sqlserver/activerecord-sqlserver-adapter

Includes all CI dependencies, Ruby, [FreeTDS](http://www.freetds.org/) and [`wait-for`](https://github.com/eficode/wait-for).

All commands assume that the `$PWD` is this directory.

### Build and Push Image

Fully automated build. The docker image is pushed as part of the build process. So you need to login to Github packages first:

```shell 
docker login ghcr.io
```

Then run the build and push script.

```shell
./build.sh 3.3.0
```

### Build Testing

Simple build command.

```shell
docker build --build-arg TARGET_VERSION=3.3.0 -t rails-sqlserver/activerecord-sqlserver-adapter:3.3.0 .
```

Ensure that the build script worked.
