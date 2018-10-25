FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    		apt-transport-https ca-certificates \
    		pwgen \
    		tzdata && \
    apt-get update && apt-get install -y --no-install-recommends \
            php7.2 \
            php7.2-curl \
            php7.2-common \
            php7.2-cli \
            php7.2-mysql \
            php7.2-mbstring \
    #        php7.2-fpm \
            php7.2-xml \
            php7.2-zip \
            git && \
     #       nano && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
            \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    #php -r "if (hash_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') \
    #        { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } \
    #        echo PHP_EOL;" && \
    php composer-setup.php \
        --filename=composer \
        --install-dir=/usr/local/bin && \
    php -r "unlink('composer-setup.php');"

WORKDIR /var/www/

# Remove default HTML directory
RUN rm -rf /var/www/html

RUN git clone https://github.com/BadChoice/handesk.git html

WORKDIR /var/www/html
RUN git checkout master
RUN composer install && \
    rm -rf /root/.composer/cache/*
RUN chmod -R 777 /var/www/html/storage && \
    chmod -R 777 /var/www/html/storage/app && \
    chmod -R 777 /var/www/html/storage/framework && \
    chmod -R 777 /var/www/html/storage/logs && \
    chmod -R 777 /var/www/html/bootstrap/cache

COPY config/handesk.env .env
RUN php artisan key:generate && \
    php artisan optimize

RUN echo "Completed installation, exiting so that Nginx and PHP-FPM can take over"
