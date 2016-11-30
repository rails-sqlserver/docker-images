#!/usr/bin/env bash

sqsh -U sa -P $SA_PASSWORD -S localhost -C "$(< /opt/rails/db-create1.sql)"
sqsh -U sa -P $SA_PASSWORD -S localhost -C "$(< /opt/rails/db-create2.sql)"
sqsh -U sa -P $SA_PASSWORD -S localhost -C "$(< /opt/rails/db-login.sql)"
