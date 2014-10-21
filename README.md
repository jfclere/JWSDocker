The docker files are for RHEL7 based on Marek work.
tomcat7 you get here a tomcat7 dockerfile to build a tomcat7 image.
mod_cluster you get here an httpd + mod_cluster ready to work with the tomcat7 of previous image.

To use it:

docker run -t --name web -i 0248810bb037 /bin/bash

docker run -t --name tomcat1 --link web:web -i 20e52d10a921 /bin/bash

docker run -t --name tomcat2 --link web:web -i 20e52d10a921 /bin/bash


Where 0248810bb037 and 20e52d10a921 are the "IMAGE ID" of the docker image created using the Dockerfile

