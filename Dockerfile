FROM php:5.4-apache

RUN apt-get update
RUN apt-get install -y vim nano git zlib1g-dev libicu-dev g++ libxml2-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libssl-dev

RUN git config --global push.default matching

RUN docker-php-ext-configure intl
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install ftp gd iconv intl mbstring mcrypt pdo pdo_mysql soap zip
RUN docker-php-ext-install mysqli

RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN curl http://get.sensiolabs.org/php-cs-fixer.phar -o php-cs-fixer
RUN chmod a+x php-cs-fixer
RUN mv php-cs-fixer /usr/local/bin/php-cs-fixer

RUN curl https://phar.phpunit.de/phpunit-4.8.21.phar -o phpunit
RUN chmod +x phpunit
RUN mv phpunit /usr/local/bin/phpunit

ADD bootstrap/docker/php.ini /usr/local/etc/php/conf.d/application.ini

RUN usermod -u 1000 www-data
RUN chown -R 1000 /var/www/

RUN echo "export TERM=xterm" >> /etc/bash.bashrc
