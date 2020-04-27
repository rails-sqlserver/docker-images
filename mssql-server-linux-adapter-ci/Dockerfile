ARG TARGET_VERSION

FROM ruby:${TARGET_VERSION}-alpine

LABEL maintainer="Wanderson Policarpo <wpolicarpo@gmail.com>"

RUN apk add git make build-base linux-headers libressl-dev sqlite-dev tzdata freetds freetds-dev libpq postgresql-dev

RUN wget https://raw.githubusercontent.com/eficode/wait-for/master/wait-for \
    && chmod +x wait-for \
    && mv wait-for /usr/local/bin

CMD ["sh"]
