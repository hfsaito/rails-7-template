FROM ruby:3.1.4-slim-bullseye

RUN apt update; apt install -y curl ca-certificates gnupg build-essential git

RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg >/dev/null && \
  echo "deb http://apt.postgresql.org/pub/repos/apt bullseye-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
  apt update && \
  apt install -y postgresql-client-14 libpq-dev

WORKDIR /usr/src/app
