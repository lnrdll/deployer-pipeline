FROM debian:stable-slim

## Install dependencies
RUN apt-get update -y
RUN apt-get install -y php-xdebug \
                       php-fpm \
                       php-mysql \
                       php7.3-cli \
                       php7.3-curl \
                       php7.3-mbstring \
                       php7.3-xml \
                       php7.3-zip \
                       php7.3-intl \
                       php7.3-bcmath \
                       php7.3-ctype \
                       php7.3-json \
                       curl git unzip \
                       php-cli \
                       libnss3-tools

## Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

## Install Deployer with recipes
RUN composer global require deployer/deployer
RUN composer global require deployer/recipes --dev

## Add Composer vendor into PATH
ENV PATH /root/.composer/vendor/bin:$PATH
