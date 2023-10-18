#!/bin/bash

sed -i "s/SQL_DATABASE/$SQL_DATABASE/g" /tmp/query.sql
sed -i "s/SQL_USER/$SQL_USER/g" /tmp/query.sql
sed -i "s/SQL_PASSWORD/$SQL_PASSWORD/g" /tmp/query.sql

mysqld_safe --init-file=/tmp/query.sql