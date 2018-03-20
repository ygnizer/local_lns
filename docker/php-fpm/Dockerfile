FROM php:7-fpm

ADD php.ini /usr/local/etc/php/conf.d/php.ini

# for Laravel5
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mbstring pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# いろいろ。
RUN apt-get install -y \
        git \
        telnet \
        curl \
        vim \
        wget \
        unzip \
        zlibc \
        zlib1g \
        zlib1g-dev \
        libxml2-dev \
        libssl-dev \
        libicu-dev \
        g++ \
  && docker-php-ext-install mysqli zip opcache

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
RUN apt-get install -y git \
 && git clone https://github.com/hnw/php-timecop.git \
 && cd php-timecop \
 && phpize \
 && ./configure \
 && make \
 && make install