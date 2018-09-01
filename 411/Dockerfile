FROM php:7-apache

RUN apt-get update && \
    apt-get -y install \
    unzip \
    git \
    libxml2-dev \
    libcurl4-openssl-dev
RUN docker-php-ext-configure \
    pdo_mysql --with-pdo-mysql=mysqlnd && \
    docker-php-ext-install \
    xml \
    pdo_mysql \
    mbstring \
    curl \
    pcntl
RUN  apt-get clean && \
     rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN a2enmod headers rewrite

WORKDIR /
COPY cron-entrypoint.sh .
COPY apache2-foreground.sh .
RUN chmod 755 *.sh

WORKDIR /var/www/411
COPY source/etsy_411-1.5.0.tgz .
RUN tar xvfz etsy_411-1.5.0.tgz && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    COMPOSER=composer-es6x.json composer install --no-dev --optimize-autoloader

WORKDIR /tmp
COPY config/* ./
RUN mv /tmp/411.conf /etc/apache2/sites-available/000-default.conf && \
    mv /tmp/init.php /var/www/411/init.php && \
    mv /tmp/mail.ini /usr/local/etc/php/conf.d/mail.ini

WORKDIR /var/www/411

EXPOSE 80