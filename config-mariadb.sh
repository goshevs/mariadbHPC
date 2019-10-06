#!/bin/bash

## This script configures the environment, 
## singularity and mariadb
##
##
##
## Simo Goshev
## Oct 04, 2019
 

## Define the environment variables required by the MariaDB container
MDB_ROOT_PASS=`head -n 2 $MDB_CREDENTIALS_FILE | tail -n 1`
MDB_USER=`head -n 3 $MDB_CREDENTIALS_FILE | tail -n 1`
MDB_USER_PASS=`head -n 4 $MDB_CREDENTIALS_FILE | tail -n 1`

## Export the environment variables to singularity
export SINGULARITYENV_MARIADB_ROOT_PASSWORD=$MDB_ROOT_PASS
export SINGULARITYENV_MARIADB_DATABASE=$MDB_DATABASE_NAME
export SINGULARITYENV_MARIADB_USER=$MDB_USER
export SINGULARITYENV_MARIADB_PASSWORD=$MDB_USER_PASS
export SINGULARITY_BIND="$MDB_ROOT_DIR/lib:/var/lib/mysql,$MDB_ROOT_DIR/run:/run/mysqld,$MDB_ROOT_DIR/log:/var/log/mysql,$MDB_ROOT_DIR/tmp:/tmp,$MDB_ROOT_DIR/tmp:/var/tmp,$MDB_CONF_DIR:/etc/mysql/conf.d"

## Write out the db hostname
dbNodeName=$(cat $PBS_NODEFILE | uniq)
echo "$dbNodeName:$MDB_PORT" > $MDB_CONF_DIR/dbNode
if [[ ! -z "$MDB_NODE_DIR_SHARED" ]]; then
	echo "$dbNodeName:$MDB_PORT" > $MDB_NODE_DIR_SHARED/dbNode
fi

## Write out the pid
echo "$PBS_JOBID" > $MDB_CONF_DIR/jobid

## Write out the container id
echo "$MY_SINGULARITY_DB_INSTANCE_NAME" > $MDB_CONF_DIR/containerID

## Create properties file for db-spark integration
if [[ ! -z "$MDB_SPARK_CREDENTIALS_FILE" ]]; then
	echo "user root" > $MDB_SPARK_CREDENTIALS_FILE
	echo "password $MDB_ROOT_PASS" >> $MDB_SPARK_CREDENTIALS_FILE
	chmod 600 $MDB_SPARK_CREDENTIALS_FILE
fi
