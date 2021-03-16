FROM wordpress:php8.0-apache
LABEL Alexander Woollam <alex.woollam@proagrica.com>


ENV XDEBUG_PORT 9000
ENV XDEBUG_IDEKEY docker

RUN pecl install "xdebug" \
    && docker-php-ext-enable xdebug

RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_port=${XDEBUG_PORT}" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.idekey=${XDEBUG_IDEKEY}" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN chown -R www-data:www-data /var/www/html/ && find /var/www/html/ -type d -exec chmod 755 {} \; && find /var/www/html/ -type f -exec chmod 644 {} \;
