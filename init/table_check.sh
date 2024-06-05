#!/bin/bash

TABLE=$1
SQL_EXISTS=$(printf 'SHOW TABLES LIKE "%s"' "$TABLE")

if [[ $(mysql -u root -p$MYSQL_ROOT_PASSWORD -e "$SQL_EXISTS" $MYSQL_DB) ]]
 then
    echo "Table exists ..."
 else
    echo "Table not exists ..."
    mysql -u root -p$MYSQL_ROOT_PASSWORD $MYSQL_DB < /usr/local/mysql/$TABLE.sql
fi
