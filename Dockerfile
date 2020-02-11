FROM php:7.3-apache-buster

RUN apt-get update \
      && apt-get install -y libpng-dev libzip-dev

RUN docker-php-ext-install gd mysqli pdo_mysql zip opcache

RUN docker-php-ext-configure zip --with-libzip

# These apache modules are required and not enabled by default in this image
RUN a2enmod rewrite headers xml2enc proxy proxy_fcgi
