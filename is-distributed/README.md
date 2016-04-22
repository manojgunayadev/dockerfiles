Dockerfiles/IS-Distributed 
===========================================

Build a distributer Identity Server docker container cluster
------------------------

### Build an Identity Server docker image

Download [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) tar.gz and place it in 'dockerfiles/is-distributed/dist/'

    mv <download path>/jdk-8u73-linux-x64.tar.gz dockerfiles/is-distributed/dist/
        
Download [WSO2 Identity Server](http://product-dist.wso2.com/downloads/api-manager/1.10.0/identity-server/wso2is-5.1.0.zip) and place that in 'dockerfiles/is-distributed/dist/'

    mv <download path>/wso2is-5.1.0.zip dockerfiles/is-distributed/dist/

Download [SVN Kit] () and place it in 'wso2base' puppet module

    svnkit-bundle-1.0.0.jar   dockerfiles/is-distributed/dist/puppet/modules/wso2base/files/configs/repository/components/dropins/
    
Download [SVN Kit] () and place it in 'wso2base' puppet module

   trilead-ssh2-1.0.0-build215.jar  dockerfiles/is-distributed/dist/puppet/modules/wso2base/files/configs/repository/components/lib/    


Download [MySQL driver] (http://dev.mysql.com/downloads/connector/j/) unzip/untar and copy the jar to 'wso2base' puppet module

    mysql-connector-java-5.1.33-bin.jar   apim-distributed/dist/puppet/modules/wso2base/files/configs/repository/components/lib/

 
 Download [wso2 mesos membership scheme jar and place it in 'wso2base' puppet module  
    mesos-membership-scheme-<version>.jar dockerfiles/apim-distributed/dist/puppet/modules/wso2base/files/configs/repository/components/dropins/
    
Builed the IS docker image
----------------------------

Change directory to 'dockerfiles/is-distributed/'.

    cd dockerfiles/is-distributed/
        
Run docker command to build image.

    docker build -t is .





