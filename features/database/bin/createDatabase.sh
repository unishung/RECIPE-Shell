#!/bin/bash

WORKING_DIR=`cd $(dirname ${0})/../ && pwd`
echo $WORKING_DIR
CONFIG_FILE="${WORKING_DIR}/conf/conf.txt"
SQL_FILE="${WORKING_DIR}/ddl/createDatabase.sql"

if [ -e $CONFIG_FILE -a -e $SQL_FILE ] ;
then 
    source $CONFIG_FILE
    mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" --password=$MYSQL_PASSWORD -P "$MYSQL_PORT" < $SQL_FILE
else
    echo "[ERROR]必要なファイルがありません"
fi
