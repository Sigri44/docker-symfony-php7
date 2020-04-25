FROM alpine:latest

#Installer php et ses libraries
RUN apk --no-cache add php7 php7-fpm php7-json php7-openssl php7-curl \
    php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session \
    php7-mbstring php7-gd php7-simplexml php7-xmlwriter php7-tokenizer \
    php7-pdo php7-pdo_pgsql php7-iconv

RUN apk --no-cache add php7-pecl-amqp php-zip php7-redis

#Installer CURL
RUN apk --no-cache add curl
#Installer nginx
RUN apk --no-cache add nginx


RUN apk upgrade

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN apk upgrade

#COPY docker/php/fpm-pool.conf /etc/php7/php-fpm.d/zzz_custom.conf
#COPY docker/php/php.ini /etc/php7/conf.d/zzz_custom.ini