FROM php:7.3-cli-alpine

## Install SSH and Rsync
RUN apk add --no-cache openssh rsync php7-pcntl libzip-dev && docker-php-ext-configure zip --with-libzip=/usr/include && docker-php-ext-install zip

## Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

## Install Deployer with recipes
RUN composer global require deployer/deployer
RUN composer global require deployer/recipes --dev

## Add Composer vendor into PATH
ENV PATH /root/.composer/vendor/bin:$PATH
