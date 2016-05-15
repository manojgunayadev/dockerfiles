# Use Ubuntu base image
FROM ubuntu:14.04

# Maintainer
MAINTAINER WSO2 <mail@wso2.org>

# Update the container and install relevant packages
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN apt-get update
#RUN apt-get -y upgrade
RUN apt-get -y install unzip tree htop puppet

# Copy Oracle JDK into /opt directory
ADD dist/jdk-8u73-linux-x64.tar.gz /opt/
# eg :-
# ADD dist/<Latest Oracle JDK tar> /opt/

# Create symlink to JDK as /opt/java
RUN ln -s /opt/jdk1.8.0_73 /opt/java && rm -rf /opt/jdk-8u73-linux-x64.tar.gz
# eg :-
# RUN ln -s /opt/<JDK decompressed directory name> /opt/java

# Create /mnt/packs directory
RUN mkdir -p /mnt/packs /etc/puppet/hieradata

# Copy WSO2 product zip into /mnt/packs
ADD dist/wso2am-1.10.0.zip /mnt/packs/
# eg :-
# ADD dist/<WSO2 product zip> /mnt/packs/

# Copy puppet related file to docker
ADD dist/puppet /etc/puppet/
ADD dist/env.rb /usr/lib/ruby/vendor_ruby/facter/

# Set environment variables
ENV HOME /root
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/java/bin
ENV JAVA_HOME /opt/java
ENV FACTER_fqdn apimanager
ENV APIM_NODE apimanager

WORKDIR /root

EXPOSE 22 10397 8280 8243 9763 9443

RUN apt-get update && apt-get install -y openssh-server && apt-get install pwgen && apt-get -y install rsync && apt-get -y install sshpass supervisor
RUN apt-get install -y python python-dev python-distribute python-pip
RUN pip install supervisor-stdout
RUN mkdir -p /var/run/sshd /var/log/supervisor
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
