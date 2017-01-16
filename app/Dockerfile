FROM luisboch/phalcon1:latest
MAINTAINER luisboch <luis.c.boch@gmail.com>

ADD phalcon /var/www/phalcon
ADD index.html /var/www/

#RUN mkdir -p /var/www/volt-temp-files && mkdir -p /var/www/phalcon/logs && /var/www/phalcon/public/img/featured && mkdir -p /var/www/phalcon/public/uploads


EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
