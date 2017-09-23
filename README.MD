# Tripwire-play

[![N|Solid](https://susetips.files.wordpress.com/2009/04/windowslivewritertripwireopensourcesecurityutility-bc12tripwire-security-linux-21.jpg)](https://github.com/Tripwire)[![N|Solid](https://camo.githubusercontent.com/14b97ba4a1327c0db2200f3892788fd873a1ce20/687474703a2f2f626c6f672e70687573696f6e2e6e6c2f77702d636f6e74656e742f75706c6f6164732f323031332f31312f646f636b65722e706e67)](https://docker.io)

Tripwire-play is a docker image for a tripwire installation on CentOS:latest base image

Docker hub : [docker-hub](https://hub.docker.com/r/prateeknischal/tripwire-play/)            

Installation instructions : [link](https://admin-ahead.com/forum/general-linux/install-and-configure-tripwire-in-centos-server/)          
Configuration : [Safari Books link](https://www.safaribooksonline.com/library/view/linux-security-cookbook/0596003919/ch01s01.html)       

### Usage
  - alter the site key and local key passwords in the [tripwire-init.sh](https://github.com/prateeknischal/tripwire-play/blob/master/tripwire-init.sh) file
  - then do a docker build 
`docker build -t <tag name> -f Dockerfile .`

### Note:
  - This uses a sleep to keep the container running, read the comments in the Dockerfile for details
  - This image cannot use the "[emailto](ftp://archive.download.redhat.com/pub/redhat/linux/7.3/it/doc/RH-DOCS/rhl-rg-en-7.3/s1-tripwire-email.html)" feature of tripwire as of now. (Contributions are welcome)