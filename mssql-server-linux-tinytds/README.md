
## mssql-server-linux-tinytds

Using the official image for Microsoft SQL Server for Linux.

* https://hub.docker.com/r/microsoft/mssql-server-linux/
* https://github.com/rails-sqlserver/tiny_tds

Includes test database & users w/permissions needed to test TinyTDS.


#### Building

Assuming that the `$PWD` is the top level docker-images directory.

```shell
docker build -t metaskills/mssql-server-linux-tinytds
```

#### Post Built Actions

Once build, create the test DB and login credentials as follows.

So far I have been unable to figure out how to run commands on the base image post build.

```shell
container=$(docker run -p 1433:1433 -d metaskills/mssql-server-linux-tinytds)
docker exec $container /opt/tinytds/setup.sh
docker stop $container
```

Can verify by doing:

```shell
container = $(docker ps -a -q --filter ancestor=metaskills/mssql-server-linux-tinytds)
docker exec -it $container bash

sqsh -U sa -P super01S3cUr3 -S localhost -C \
  "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'"
sqsh -U sa -P super01S3cUr3 -S localhost -C \
  "SELECT name FROM sys.database_principals"
```

