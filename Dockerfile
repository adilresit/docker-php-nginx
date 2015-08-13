FROM  ubuntu:latest

MAINTAINER adilresitdursun <www.at.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install nginx php5-fpm php5-mysql php-apc php5-imagick php5-imap php5-mcrypt
ADD my.conf my.conf
RUN rm /etc/nginx/sites-available/default
RUN cat my.conf >> /etc/nginx/sites-available/default 
RUN echo "cgi.fix_pathinfo = 0;" >> /etc/php5/fpm/php.ini
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /var/www
ADD deneme.php deneme.php
RUN cat deneme.php >> /var/www/index.php

EXPOSE 80

CMD service php5-fpm start && nginx
