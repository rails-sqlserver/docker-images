FROM microsoft/mssql-server-linux:2017-GA
MAINTAINER Ken Collins <ken@metaskills.net>
LABEL description="Microsoft SQL Server for Linux - Rails Testing" \
      version="2017-GA"

ENV ACCEPT_EULA Y
ENV SA_PASSWORD super01S3cUr3
EXPOSE 1433

COPY rails/* /opt/rails/
