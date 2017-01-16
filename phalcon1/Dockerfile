FROM ubuntu:14.04
MAINTAINER luisboch <luis.c.boch@gmail.com>

RUN echo "deb http://ppa.launchpad.net/phalcon/legacy/ubuntu trusty main " > /etc/apt/sources.list.d/phalcon1.list && apt-get update && apt-get upgrade -y && apt-get install -y --force-yes php5 apache2 php5-pgsql php5-imagick php5-curl php5-json php5-mysqlnd php5-phalcon
ADD apache2.conf /etc/apache2/apache2.conf
ADD 000-default.conf  /etc/apache2/sites-available/
ADD default-ssl.conf /etc/apache2/sites-available/
ADD php.ini /etc/php5/apache2/
RUN a2enmod rewrite
RUN apt-get -y purge python*

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
