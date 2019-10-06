#!/bin/bash

## The script configures the environment and defaults for 
## mariadb, launches the db, and tears it down 
##
##
##
## Simo Goshev
## Oct 04, 2019

initFlag=$1

echo "Setting up environment and defaults"
source ./userInput.sh
source $MDB_SCRIPTS_DIR/config-mariadb.sh

## Initialize a new db if needed
if [[ "$initFlag" = "init" ]]; then
	echo "Initializing a new database"
	yes 2>/dev/null | $MDB_SCRIPTS_DIR/init-mariadb.sh
fi

echo "Starting the db instance"
source $MDB_SCRIPTS_DIR/start-mariadb.sh

## Retrieve the walltime of the job
jobNumber=$(echo $PBS_JOBID | grep -Eo '[0-9]+')
jobTimeRemaining=$(qstat -f $jobNumber | grep Walltime.Remaining | grep -Eo '[0-9]+')
runTime=$(expr $jobTimeRemaining - 300)

## Keep the job running for runTime seconds
sleep $runTime

echo "Shutting down the db instance"
source $MDB_SCRIPTS_DIR/stop-mariadb.sh

