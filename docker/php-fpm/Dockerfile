FROM php:7-fpm

ADD php.ini /usr/local/etc/php/conf.d/php.ini

RUN apt-get update \
  && apt-get install -y telnet \
  && docker-php-ext-install pdo_mysql mysqli mbstring iconv

RUN apt-get update \
  && apt-get install -y libz-dev zlib1g-dev

#RUN apt-get install -y php-xdebug \
#  && docker-php-ext-install xdebug

# install php-timecop
RUN apt-get install -y git \
 && git clone https://github.com/hnw/php-timecop.git \
 && cd php-timecop \
 && phpize \
 && ./configure \
 && make \
 && make install