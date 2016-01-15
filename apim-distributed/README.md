Dockerfiles/APIM-Distributed [Experimental]
===========================================

Build a distributer API Manager docker container cluster
------------------------

### Build an API manager docker image

Download [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) tar.gz and place it in 'dockerfiles/apim-distributed/dist/'

    mv <download path>/jdk-8u45-linux-x64.tar.gz dockerfiles/apim-distributed/dist/
        
Download [WSO2 API manager](http://wso2.com/products/api-manager) and place that in 'dockerfiles/apim-distributed/dist/'

    mv <download path>/wso2am-1.10.0.zip dockerfiles/apim-distributed/dist/

Download [SVN Kit] () and place it in 'wso2base' puppet module

    svnkit-bundle-1.0.0.jar   dockerfiles/apim-distributed/dist/puppet/modules/wso2base/files/configs/repository/components/dropins/


Download [MySQL driver] (http://dev.mysql.com/downloads/connector/j/) unzip/untar and copy the jar to 'wso2base' puppet module

    mysql-connector-java-5.1.33-bin.jar   apim-distributed/dist/puppet/modules/wso2base/files/configs/repository/components/lib/


Builed the APIM docker image
----------------------------

Change directory to 'dockerfiles/apim-distributed/'.

    cd dockerfiles/apim-distributed/
        
Run docker command to build image.

    docker build -t apim .


Install docker compose
----------------------

    sudo curl -L https://github.com/docker/compose/releases/download/1.5.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

    sudo chmod +x /usr/local/bin/docker-compose


Start a Docker containers using docker compose 
----------------------------------------------

Note: Do *not* start all containers at once because it takes sometime to start the database server and populate the databases.

Remove unused docker instances with same name

    docker-compose rm 

Start Database server
 
    To Start MySQL server 

        docker-compose up -d mysql

    -- Or --

    To Start PostgreSQL server 

        docker-compose up -d postgresql
        
Start Database client
 
    To Start MySQL client

        docker-compose up -d mysql-client

    -- Or --

    To Start PostgreSQL client

        docker-compose up -d postgresql-client

Note: MySQL/PostgreSQL client will get killed it self after populating initial databases and tables

Start APIM

    To Start a standalone container instance of APIM
    	
	docker-compose up -d apim-node1


    To Start a key manager container instance of APIM

	docker-compose up -d apim-keymanager


    To Start a gateway container instance of APIM

	docker-compose up -d apim-gateway


    To Start a pub/store container instance of APIM

	docker-compose up -d apim-pubstore


Login to any docker instance
-----------------------------

Use 'exec' command to login to docker instances

    docker exec -i -t <instance-id/name> bash


