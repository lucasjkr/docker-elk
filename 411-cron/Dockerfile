#FROM php:7-apache
FROM debian:jessie-slim

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y \
        ca-certificates \
        apt-transport-https \
        software-properties-common \
        python-software-properties \
        wget

RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
RUN echo "deb https://packages.sury.org/php/ jessie main" | tee /etc/apt/sources.list.d/php.list

RUN apt-get update
RUN apt-get install -y \
    curl \
    unzip \
    git \
    libxml2-dev \
    libcurl4-openssl-dev \
    cron
RUN apt-get update && apt-get install -y \
    php7.2 \
    php7.2-dev \
    php7.2-cgi \
    php7.2-cli \
    php7.2-common \
    php7.2-curl \
    #php7.2-gd \
    #php7.2-imap \
    php7.2-mysql \
    #php7.2-intl \
    php7.2-mbstring

RUN apt-get install -y \
    php-pear \
    #php7.2-pspell \
    #php7.2-recode \
    php7.2-soap \
    #php7.2-sqlite3 \
    #php7.2-tidy \
    php7.2-xmlrpc \
    php7.2-xsl
    #php7.2-zip \
    #libapache2-mod-php7.2

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

WORKDIR /var/www/411
RUN curl -L https://github.com/etsy/411/releases/download/v1.5.0/release.tgz | tar xz
RUN COMPOSER=composer-es6x.json composer install --no-dev --optimize-autoloader

RUN mkdir /data

COPY config/config.php .
COPY config/init.php .

RUN chmod ugo+rx -R /data
RUN chown www-data:www-data -R /data

COPY config/mail.ini /usr/local/etc/php/conf.d/
RUN touch /var/log/cron.log

COPY cron.php /var/www/411/bin/
COPY worker.php /var/www/411/bin/

COPY config/cron-entrypoint.sh /cron-entrypoint.sh
RUN chmod +x /cron-entrypoint.sh
ENTRYPOINT ["/cron-entrypoint.sh"]
