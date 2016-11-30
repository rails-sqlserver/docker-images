
## mssql-server-linux-rails

Using the official image for Microsoft SQL Server for Linux.

* https://hub.docker.com/r/microsoft/mssql-server-linux/
* https://github.com/rails-sqlserver/docker-images
* https://github.com/rails-sqlserver/activerecord-sqlserver-adapter

Includes test database & users w/permissions needed to test the SQL Server adapter for Rails.


#### Building

Assuming that the `$PWD` is this directory.

```shell
./build.sh
```

#### Verify

Ensure that the build script worked.

```shell
container = $(docker ps -a -q --filter ancestor=metaskills/mssql-server-linux-rails)
docker exec -it $container bash

sqsh -U sa -P super01S3cUr3 -S localhost -C "SELECT name FROM master.dbo.sysdatabases"
sqsh -U sa -P super01S3cUr3 -S localhost -C "SELECT loginname, dbname FROM syslogins"
```
