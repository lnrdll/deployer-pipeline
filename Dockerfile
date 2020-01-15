FROM alpine:latest

## Install dependencies
RUN apk --update add curl \
                     git \
                     unzip \
                     openssl \
                     rsync \
                     php7 \
                     php7-xdebug \
                     php7-fpm \
                     php7-cli \
                     php7-curl \
                     php7-mbstring \
                     php7-xml \
                     php7-zip \
                     php7-intl \
                     php7-bcmath \
                     php7-phar \
                     php7-ctype \
                     php7-json \
                     php7-cli \
                     php7-openssl \
                     php7-dom \
                     php7-fileinfo \
                     php7-tokenizer \
                     php7-pcntl \
                     php7-posix

## Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

## Install Deployer with recipes
RUN composer global require deployer/deployer
RUN composer global require deployer/recipes --dev

## Add Composer vendor into PATH
ENV PATH /root/.composer/vendor/bin:$PATH
