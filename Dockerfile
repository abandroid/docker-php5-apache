FROM php:5.4-apache

RUN apt-get update
RUN apt-get install -y vim nano git zlib1g-dev libicu-dev g++ libxml2-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libssl-dev

RUN docker-php-ext-configure intl
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install ftp gd iconv intl mbstring mcrypt pdo pdo_mysql soap zip
RUN docker-php-ext-install mysqli

RUN a2enmod rewrite

ADD application.ini /usr/local/etc/php/conf.d/application.ini

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN usermod -u 1000 www-data
RUN groupadd -g 1000 usergroup && usermod -aG usergroup www-data
