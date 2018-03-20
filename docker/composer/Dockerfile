FROM php:7.1.4-cli
LABEL maintainer "ygnizer"

WORKDIR /tmp

RUN apt-get update -y && \
	apt-get install -y git unzip sudo && \
	apt-get clean

# create docker user
RUN useradd -d /home/docker -m -s /bin/bash -u 1000 -g 50 docker

# install composer
RUN curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer && \
	composer self-update

ENV COMPOSER_HOME /home/docker/.composer
RUN sudo -u docker composer global require hirak/prestissimo

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

USER 1000

ENTRYPOINT ["composer"]
CMD ["--help"]