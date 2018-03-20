FROM php:7.1.4-cli
LABEL maintainer "ygnizer"

RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    libmcrypt-dev \
  && docker-php-ext-install \
    pdo_mysql \
    mysqli \
    mbstring \
    gd \
    iconv \
    mcrypt \
  && apt-get clean

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

ENTRYPOINT ["php"]
CMD ["--version"]