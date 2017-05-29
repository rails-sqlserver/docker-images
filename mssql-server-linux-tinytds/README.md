
## mssql-server-linux-tinytds

Using the official image for Microsoft SQL Server for Linux.

* https://hub.docker.com/r/microsoft/mssql-server-linux/
* https://github.com/rails-sqlserver/docker-images
* https://github.com/rails-sqlserver/tiny_tds

Includes test database & users w/permissions needed to test TinyTDS.

All commands assume that the `$PWD` is this directory.


### Build

Fully automated build

```shell
./build.sh
```


### Build Testing

Simple build command.

```shell
docker build -t metaskills/mssql-server-linux-tinytds .
```

Ensure that the build script worked.

```shell
docker run -p 1433:1433 -d metaskills/mssql-server-linux-tinytds
container=$(docker ps --all --quiet --filter ancestor=metaskills/mssql-server-linux-tinytds)
docker exec -it $container bash

/opt/mssql-tools/bin/sqlcmd -U sa -P super01S3cUr3 -S localhost -Q "SELECT loginname, dbname FROM syslogins"
/opt/mssql-tools/bin/sqlcmd -U sa -P super01S3cUr3 -S localhost -Q "SELECT name FROM master.dbo.sysdatabases"

docker stop $container
```
