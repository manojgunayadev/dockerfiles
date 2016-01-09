#!/bin/bash -x

while true 
do 
    echo '1' >/dev/tcp/$POSTGRES_PORT_5432_TCP_ADDR/$POSTGRES_PORT_5432_TCP_PORT 2>/dev/null ;
    if [ "$?" -eq 0 ] ; then
        break;
    fi
    sleep 1
done

POSTGRE_CMD="psql -h$POSTGRES_PORT_5432_TCP_ADDR -P$POSTGRES_PORT_5432_TCP_PORT  -U postgres'

$POSTGRE_CMD '-e create database dbApimConfig'
$POSTGRE_CMD '-e create database dbUserstore'
$POSTGRE_CMD '-e create database dbGovernance'
$POSTGRE_CMD '-e create database dbApiMgt'
$POSTGRE_CMD '-e create database dbApiStatus'

$POSTGRE_CMD '-e create user ConfigDBUser with password 'ConfigDBUserPass'
$POSTGRE_CMD '-e grant all privileges on database "dbApimConfig" to ConfigDBUser

$POSTGRE_CMD '-e create user UserstoreUser with password 'UserstoreUserPass'
$POSTGRE_CMD '-e grant all privileges on database "dbUserstore" to UserstoreUser

$POSTGRE_CMD '-e create user GovernanceUser with password 'GovernanceUserPass'
$POSTGRE_CMD '-e grant all privileges on database "dbGovernance" to GovernanceUser

$POSTGRE_CMD '-e create user ApiMgtUser with password 'ApiMgtUserPass'
$POSTGRE_CMD '-e grant all privileges on database "dbApiMgt" to ApiMgtUser

$POSTGRE_CMD '-e create user ApiStatuUser with password 'ApiStatuUserPass'
$POSTGRE_CMD '-e grant all privileges on database "dbApiStatus" to ApiStatuUser


$POSTGRE_CMD -d dbApimConfig -a -f /dbscripts/postgresql.sql
$POSTGRE_CMD -d dbUserstore -a -f /dbscripts/postgresql.sql
$POSTGRE_CMD -d dbGovernance -a -f /dbscripts/postgresql.sql
$POSTGRE_CMD -d dbApiStatus -a -f /dbscripts/postgresql.sql
$POSTGRE_CMD -d dbApiMgt -a -f /dbscripts/apimgt/postgresql.sql
