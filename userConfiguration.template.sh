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


####### ==> Project directory
export PROJECT_ROOT_DIR=

####### ==> Database scripts directory

## DB setup scripts directory
export MDB_SCRIPTS_DIR=


####### ==> Database configuration

## DB root directory
## !!! IF WORKING WITH SENSITIVE DATA, POINT TO A DESIGNATED DIRECTORY !!!
## !!! CONSULT WITH THE SIGNEE OF THE DUA/DMP !!!
export MDB_ROOT_DIR=

## DB configuration directory
export MDB_CONF_DIR=

## DB port (keep as it; available to root only)
export MDB_PORT=3306

## OPTIONAL: File to post db node information (for multiple db users)
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

## Root credentials file for spark jdbc
export MDB_SPARK_ROOT_CREDENTIALS_FILE=

## User credentials file for spark jdbc (if db users)
export MDB_SPARK_USER_CREDENTIALS_FILE=
