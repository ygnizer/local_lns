FROM php:7.1.4-fpm
LABEL maintainer "ygnizer"

RUN apt-get update && \
  apt-get install -y \
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

# いろいろ。
RUN apt-get install -y \
        git \
        telnet \
        curl \
        vim \
        wget \
  && apt-get clean

#        unzip \
#        zlibc \
#        zlib1g \
#        zlib1g-dev \
#        libxml2-dev \
#        libssl-dev \
#        libicu-dev \
#        gcc \
#  && docker-php-ext-install zip opcache \
#  && apt-get clean

# Install xdebug
#RUN pecl install xdebug
RUN curl -fsSL 'https://xdebug.org/files/xdebug-2.4.0.tgz' -o xdebug.tar.gz \
    && mkdir -p xdebug \
    && tar -xf xdebug.tar.gz -C xdebug --strip-components=1 \
    && rm xdebug.tar.gz \
    && ( \
    cd xdebug \
    && phpize \
    && ./configure --enable-xdebug \
    && make -j$(nproc) \
    && make install \
    ) \
    && rm -r xdebug \
    && docker-php-ext-enable xdebug

# Install timecop
RUN git clone https://github.com/hnw/php-timecop.git \
 && cd php-timecop \
 && phpize \
 && ./configure \
 && make \
 && make install

ADD php.ini /usr/local/etc/php/conf.d/php.ini

RUN mkdir -p /data
VOLUME ["/data"]