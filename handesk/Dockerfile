FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    		apt-transport-https ca-certificates \
    		pwgen \
    		tzdata \
    	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    apache2 \
    php7.2 \
    php7.2-curl \
    php7.2-common \
    php7.2-cli \
    php7.2-mysql \
    php7.2-mbstring \
    php7.2-fpm \
    php7.2-xml \
    php7.2-zip \
    git

RUN apt-get install libapache2-mod-php7.2

RUN a2enmod php7.2 rewrite

RUN service apache2 restart
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php \
    --filename=composer \
    --install-dir=/usr/local/bin
RUN php -r "unlink('composer-setup.php');"

WORKDIR /var/www/

# Remove default HTML directory
RUN rm -rf /var/www/html

RUN git clone https://github.com/BadChoice/handesk.git html

WORKDIR /var/www/html
RUN git checkout master

RUN chmod -R 777 /var/www/html/storage
RUN chmod -R 777 /var/www/html/storage/app
RUN chmod -R 777 /var/www/html/storage/framework
RUN chmod -R 777 /var/www/html/storage/logs
COPY config/handesk.env .env

RUN composer install

RUN php artisan key:generate

COPY config/.htaccess /var/www/html/public/.htaccess

COPY config/handesk.conf /etc/apache2/sites-available/000-default.conf
COPY apache2-foreground.sh /apache2-foreground.sh

#RUN php artisan optimize

RUN echo "Completed installation, exiting so that Nginx and PHP-FPM can take over"
EXPOSE 80

USER root
CMD /apache2-foreground.sh