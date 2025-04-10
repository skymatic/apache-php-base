FROM php:8.3-apache
MAINTAINER Sebastian Stenzel <sebastian.stenzel@skymatic.de>

RUN apt-get update && apt-get install --no-install-recommends -y \
  libgmp-dev \
  libpq-dev \
  unzip \
  && rm -rf /var/lib/apt/lists/*

RUN pecl install \
  apcu-5.1.24 \
  && docker-php-ext-enable \
  apcu

RUN docker-php-ext-install \
  gmp
