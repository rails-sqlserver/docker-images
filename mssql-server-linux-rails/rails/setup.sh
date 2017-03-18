#!/usr/bin/env bash

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i /opt/rails/db-create1.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i /opt/rails/db-create2.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i /opt/rails/db-login.sql
