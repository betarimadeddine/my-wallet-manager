FROM php:8.2-fpm-alpine as base

ARG PORT

# Set working directory
WORKDIR /var/www/html

# Install PDO and PDO MySQL extension
RUN docker-php-ext-install pdo pdo_mysql

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin/ --filename=composer \
    && rm composer-setup.php

# Copy only the necessary composer files (composer.json, composer.lock)
COPY composer.* .

# Install dependencies
RUN composer install --ignore-platform-reqs --no-interaction --no-scripts

# Copy the entire application to the container
COPY . .

# Generate autoloader
RUN composer dump-autoload

# Adjust permissions for specific directories
RUN chmod -R 777 storage bootstrap

# Clear any optimization cache
RUN php artisan optimize:clear

# Expose the port for prod
EXPOSE $PORT
