# PHP 8.4.27 fixes CVE-2026-109618 and CVE-2026-109619 (https://www.php.net/archive/2026.php#2026-10-21-5).
# Bump the tag and digest together whenever a new 8.4.x security release is published.
FROM php:8.4.27-apache@sha256:a0b75cee7023ba2c127138dcad2ecc6ec7e09435534645e70450f29f24ea2a5a

RUN docker-php-ext-install mysqli \
 && a2enmod rewrite headers \
 && a2dissite 000-default \
 && cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY etc/php/archives.ini "$PHP_INI_DIR/conf.d/zz-archives.ini"
COPY etc/apache2/sites-available/archives.conf /etc/apache2/sites-available/archives.conf
RUN a2ensite archives

# Web applications
COPY var/www/html/annual-checklist/ /var/www/annual-checklist/
# zf1-future, shared by the 2010+ apps; outside any served path
COPY var/www/html/lib/ /var/www/lib/

# Zend apps (2010+) write their logs into application/log
RUN for y in 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019; do \
      mkdir -p /var/www/annual-checklist/$y/application/log; \
    done \
 && chown -R root:root /var/www/annual-checklist \
 && chown -R www-data:www-data /var/www/annual-checklist/20*/application/log

EXPOSE 80
