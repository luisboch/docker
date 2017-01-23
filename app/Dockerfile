FROM luisboch/phalcon1:latest
MAINTAINER luisboch <luis.c.boch@gmail.com>

RUN rm -rf /var/www/phalcon/ && rm -rf /var/www/html/
ADD phalcon /var/www/phalcon/
ADD index.html /var/www/

RUN mkdir -p /var/www/volt-temp-files


EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
