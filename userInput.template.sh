#!/bin/bash

## This script generates environment variables for 
## singularity and mariadb
##
##
##
## Simo Goshev
## Oct 04, 2019
 

#########################################################
## Load singularity module

module load singularity/3.1.0



########################################################
## Configuration variables


####### ==> Database scripts directory
export MDB_SCRIPTS_DIR=


####### ==> Database configuration

## DB root directory
export MDB_ROOT_DIR=

## DB configuration directory
export MDB_CONF_DIR=

## DB port (option available to root only!)
export MDB_PORT=3306

## File to post db node information (for multiple db users)
export MDB_NODE_DIR_SHARED=

## Database name
export MDB_DATABASE_NAME=

## DB credentials file
export MDB_CREDENTIALS_FILE=


####### ==>  Singularity configuration

## Singularity image location 
export MDB_IMAGE=

## Singularity instance name 
export MY_SINGULARITY_DB_INSTANCE_NAME=


####### ==> Spark integration 

## Credentials file for spark jdbc
export MDB_SPARK_CREDENTIALS_FILE=



