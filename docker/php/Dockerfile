FROM php:5-apache

RUN apt-get update
RUN apt-get install -y wget vim nano git zlib1g-dev libicu-dev g++ libxml2-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libssl-dev

RUN pecl install mongo
RUN docker-php-ext-enable mongo

RUN git config --global push.default matching

RUN docker-php-ext-configure intl
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install bcmath ftp gd iconv intl mbstring mcrypt pdo pdo_mysql soap zip
RUN docker-php-ext-install mysqli

RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN curl http://get.sensiolabs.org/php-cs-fixer.phar -o php-cs-fixer
RUN chmod a+x php-cs-fixer
RUN mv php-cs-fixer /usr/local/bin/php-cs-fixer

RUN curl -L https://phar.phpunit.de/phpunit-4.8.21.phar -o phpunit
RUN chmod a+x phpunit
RUN mv phpunit /usr/local/bin/phpunit

RUN curl http://get.sensiolabs.org/security-checker.phar -o security-checker
RUN chmod a+x security-checker
RUN mv security-checker /usr/local/bin/security-checker

ADD application.ini /usr/local/etc/php/conf.d/application.ini

RUN git config --global push.default matching

RUN wget -O - https://packagecloud.io/gpg.key | apt-key add -
RUN echo "deb http://packages.blackfire.io/debian any main" | tee /etc/apt/sources.list.d/blackfire.list
RUN apt-get update
RUN apt-get install -y blackfire-agent blackfire-php
ENTRYPOINT sh /var/www/html/docker/php/entrypoint.sh

RUN apt-get update && apt-get install -y git bash-completion
RUN curl -LsS https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o /etc/bash_completion.d/git
RUN curl -LsS https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git-flow-completion.bash -o /etc/bash_completion.d/git-flow
RUN echo 'source /etc/bash_completion.d/git' >> /var/www/.bashrc
RUN echo 'source /etc/bash_completion.d/git-flow' >> /var/www/.bashrc

RUN usermod -u 1000 www-data
RUN chown -R 1000 /var/www/

RUN echo "export TERM=xterm" >> /etc/bash.bashrc
