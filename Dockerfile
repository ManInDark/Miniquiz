FROM debian:unstable-20211220-slim

RUN apt update; apt install -y nginx mysql-server php-fpm php-mysql
RUN usermod -d /var/lib/mysql/ mysql

WORKDIR /
RUN mkdir /sites

COPY run.sh quizduell.sql ./
COPY nginx-config /etc/nginx/
COPY *.svg *.css *.php *.html *.js /sites/

EXPOSE 80 443
CMD ["bash", "run.sh"]
