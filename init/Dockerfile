FROM mysql:8.4.0

MAINTAINER fegrus

ENV MYSQL_RANDOM_ROOT_PASSWORD=yes

COPY init.sh /docker-entrypoint-initdb.d

COPY table_check.sh /usr/local/

COPY sql /usr/local/mysql

