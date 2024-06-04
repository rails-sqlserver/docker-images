ARG TARGET_VERSION

FROM ruby:${TARGET_VERSION}-alpine

LABEL maintainer="Aidan Haran <aidanharan@yahoo.com>"

RUN apk add git make build-base linux-headers sqlite-dev tzdata freetds freetds-dev libpq postgresql-dev

# Allow this package installation to fail for Rubies v3.1.3+
RUN apk add git make libressl-dev || true

RUN wget https://raw.githubusercontent.com/eficode/wait-for/master/wait-for \
    && chmod +x wait-for \
    && mv wait-for /usr/local/bin

CMD ["sh"]
