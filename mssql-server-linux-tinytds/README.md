
## mssql-server-linux-tinytds

Using the official image for Microsoft SQL Server for Linux.

* https://hub.docker.com/r/microsoft/mssql-server-linux/
* https://github.com/rails-sqlserver/tiny_tds

Includes test database & users w/permissions needed to test TinyTDS.


#### Building

Assuming that the `$PWD` is this directory.

```shell
docker build -t metaskills/mssql-server-linux-tinytds .
```

#### Verify

Ensure that the build script worked.

```shell
container = $(docker ps -a -q --filter ancestor=metaskills/mssql-server-linux-rails)
docker exec -it $container bash

sqsh -U sa -P super01S3cUr3 -S localhost -C "SELECT name FROM master.dbo.sysdatabases"
sqsh -U sa -P super01S3cUr3 -S localhost -C "SELECT loginname, dbname FROM syslogins"
```
