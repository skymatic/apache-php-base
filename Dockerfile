FROM php:7.4-apache
MAINTAINER Sebastian Stenzel <sebastian.stenzel@skymatic.de>

RUN apt-get update && apt-get install -y \
  libgmp-dev \
  libpq-dev \
  unzip \
  && rm -rf /var/lib/apt/lists/*
RUN pecl install \
  apcu-5.1.18 \
  && docker-php-ext-enable \
  apcu
RUN docker-php-ext-install \
  gmp \
  pdo \
  pdo_pgsql \
  pgsql
