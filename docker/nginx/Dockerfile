FROM nginx:latest
LABEL maintainer "ygnizer"

ADD nginx.conf /etc/nginx/nginx.conf
ADD fastcgi.conf /etc/nginx/fastcgi.conf
ADD server.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /data
VOLUME ["/data"]
