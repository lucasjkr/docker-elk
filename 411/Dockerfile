FROM php:7-apache

RUN apt-get update && \
    apt-get -y install \
    unzip \
    git \
    libxml2-dev \
    libcurl4-openssl-dev \
    gnupg
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

RUN git clone https://github.com/Nemobox-app/411.git  /var/www/411
WORKDIR /var/www/411

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    COMPOSER=composer-es6x.json composer install --no-dev --optimize-autoloader

WORKDIR /tmp
COPY config/* ./
RUN mv /tmp/411.conf /etc/apache2/sites-available/000-default.conf && \
    mv /tmp/init.php /var/www/411/init.php && \
    mv /tmp/mail.ini /usr/local/etc/php/conf.d/mail.ini && \
     mkdir /var/www/411/htdocs/assets/js/libs/

COPY source/assets/css/main.css /var/www/411/htdocs/assets/css/main.css
COPY source/assets/js/libs/require.js /var/www/411/htdocs/assets/js/libs/require.js
COPY source/assets/js/main.js /var/www/411/htdocs/assets/js/main.js
COPY source/assets/fonts/* /var/www/411/htdocs/assets/fonts/
COPY source/assets/imgs/* /var/www/411/htdocs/assets/imgs/

# Install NPM
#RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
#RUN apt-get install -y nodejs
#RUN npm install -g bower
#RUN bower install --allow-root

WORKDIR /var/www/411

EXPOSE 80