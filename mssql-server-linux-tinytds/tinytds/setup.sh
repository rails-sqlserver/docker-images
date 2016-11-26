#!/usr/bin/env bash

sqsh -U sa -P $SA_PASSWORD -S localhost -C "$(< /opt/tinytds/db-create.sql)"
sqsh -U sa -P $SA_PASSWORD -S localhost -C "$(< /opt/tinytds/db-login.sql)"
