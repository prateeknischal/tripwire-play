FROM centos:latest

MAINTAINER Prateek Nischal <prateeknischal25@gmail.com>

RUN yum install wget sendmail -y && \
	wget http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm && \
	rpm -ivh epel-release-6-8.noarch.rpm && \
	yum install tripwire -y

ADD tripwire-init.sh /tmp/tripwire-init.sh

RUN cd /tmp && \
	chmod +x tripwire-init.sh

# Need to run all the tripwire init in the script as it uses
# the hostname to name the local key file and if ran as RUN
# command then will run in a different container and hostname
# would not match this breaking the tripwire installation
CMD ["/tmp/tripwire-init.sh"]