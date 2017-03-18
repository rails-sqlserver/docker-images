FROM microsoft/mssql-server-linux
MAINTAINER Ken Collins <ken@metaskills.net>
LABEL description="Microsoft SQL Server for Linux - TinyTDS Testing" \
      version="1.4"

ENV ACCEPT_EULA Y
ENV SA_PASSWORD super01S3cUr3
EXPOSE 1433

COPY tinytds/* /opt/tinytds/
