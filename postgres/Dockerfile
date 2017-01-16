FROM ubuntu:16.04
MAINTAINER luisboch <luis.c.boch@gmail.com>

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/postgres.list &&\
	 apt-get update && apt-get install -y wget &&\
	 wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - &&\
	 apt-get update && apt-get upgrade -y &&\
	 apt-get install -y postgresql

EXPOSE 5432
CMD ["service postgresql start", "-D", "FOREGROUND"]
