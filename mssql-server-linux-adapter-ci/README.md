
## mssql-server-linux-adapter-ci

Using the official images for ruby.

* https://hub.docker.com/_/ruby
* https://github.com/rails-sqlserver/docker-images
* https://github.com/rails-sqlserver/activerecord-sqlserver-adapter

Includes all CI dependencies, Ruby, [FreeTDS](http://www.freetds.org/) and [`wait-for`](https://github.com/eficode/wait-for).

All commands assume that the `$PWD` is this directory.

### Build

Fully automated build

```shell
./build.sh 2.7.1
```

### Build Testing

Simple build command.

```shell
docker build -t railssqlserver/activerecord-sqlserver-adapter:2.7.1 .
```

Ensure that the build script worked.
