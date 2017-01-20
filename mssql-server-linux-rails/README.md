
## mssql-server-linux-rails

Using the official image for Microsoft SQL Server for Linux.

* https://hub.docker.com/r/microsoft/mssql-server-linux/
* https://github.com/rails-sqlserver/docker-images
* https://github.com/rails-sqlserver/activerecord-sqlserver-adapter

Includes test database & users w/permissions needed to test the SQL Server adapter for Rails.

All commands assume that the `$PWD` is this directory.


### Build

Fully automated build

```shell
./build.sh
```


### Build Testing

Simple build command.

```shell
docker build -t metaskills/mssql-server-linux-rails .
```

Ensure that the build script worked.

```shell
docker run -p 1433:1433 -d metaskills/mssql-server-linux-rails
container=$(docker ps --all --quiet --filter ancestor=metaskills/mssql-server-linux-rails)
docker exec -it $container bash

sqsh -U sa -P super01S3cUr3 -S localhost -C "SELECT name FROM master.dbo.sysdatabases"
sqsh -U sa -P super01S3cUr3 -S localhost -C "SELECT loginname, dbname FROM syslogins"
tsql -H localhost -p 1433 -U rails -P '' -D activerecord_unittest

docker stop $container
```
