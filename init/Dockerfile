FROM mysql:5.7.15

MAINTAINER fegrus

ENV MYSQL_DATABASE=<myQuizAppDB> \
    MYSQL_ROOT_PASSWORD=<MYSQL_ROOT_PASSWORD>

ADD myquizappdb.sql /docker-entrypoint-initdb.d

EXPOSE 3306