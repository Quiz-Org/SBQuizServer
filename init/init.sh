#!/bin/bash

echo "** Creating default DB"

mysql -u root -p$MYSQL_ROOT_PASSWORD --execute \
"
  CREATE DATABASE IF NOT EXISTS $MYSQL_DB;
"

echo "** Creating default User and granting SELECT"

mysql -u root -p$MYSQL_ROOT_PASSWORD --execute \
"
  DROP USER IF EXISTS $MYSQL_USER;
  CREATE USER $MYSQL_USER IDENTIFIED BY '$MYSQL_PASSWORD';
  GRANT SELECT ON $MYSQL_DB.* TO $MYSQL_USER;
  FLUSH PRIVILEGES;
"
echo "** Checking quiz table"

bash /usr/local/table_check.sh quiz

echo "** Checking question table"

bash /usr/local/table_check.sh question

echo "** Checking answer table"

bash /usr/local/table_check.sh answer
