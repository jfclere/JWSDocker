The docker files are for RHEL7 based on Marek work.
tomcat7 you get here a tomcat7 dockerfile to build a tomcat7 image.
mod_cluster you get here an httpd + mod_cluster ready to work with the tomcat7 of previous image.

To prepare the images (on need a RHEL7 VM or box).
in each mod_cluster and tomcat7:
docker build .
It returns at the end of build the image ID something like:
Successfully built f9c54cc632d6
in tomcat7 there.

From any location in the box:

docker run -t --name web -p 80:80 -p 6666:6666 -i afeb52664695

docker run --name tomcat1 --link web:web -i f9c54cc632d6

docker run --name tomcat2 --link web:web -i f9c54cc632d6

Where f9c54cc632d6 and afeb52664695 are the "IMAGE ID" of the docker image created using the Dockerfile

