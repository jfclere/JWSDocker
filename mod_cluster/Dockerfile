FROM docker-registry.usersys.redhat.com/goldmann/jboss-base:latest
MAINTAINER Jean-Frederic Clere jclere@redhat.com

# Install required software to run JBoss EWS
USER root
RUN yum -y install apr-util openssl mailcap hostname net-tools && yum clean all

# Expose the port 80
EXPOSE 80
EXPOSE 6666
# upd doesn't seem supported for the moment.
#EXPOSE 23364/upd

# Version of the EWS distribution
ENV JBOSS_EWS_VERSION_MAJOR 2
ENV JBOSS_EWS_VERSION_MINOR 1
ENV JBOSS_EWS_VERSION_MICRO 0
ENV JBOSS_EWS_VERSION $JBOSS_EWS_VERSION_MAJOR.$JBOSS_EWS_VERSION_MINOR.$JBOSS_EWS_VERSION_MICRO

# Download the EWS distribution and unpack it
RUN curl http://download.devel.redhat.com/released/JBossEWS/$JBOSS_EWS_VERSION/jboss-ews-httpd-$JBOSS_EWS_VERSION-RHEL7-x86_64.zip -o ews.zip && unzip -q ews.zip && rm ews.zip && mv jboss-ews-$JBOSS_EWS_VERSION_MAJOR.$JBOSS_EWS_VERSION_MINOR ews

# Usable in scripts
ENV EWS_HOME /opt/jboss/ews

# Specify the workdir
# Required for the apachectl command
WORKDIR ews/httpd

# Not required + prevents httpd from boot
RUN mv conf.d/auth_kerb.conf conf.d/auth_kerb.conf.example
RUN mv conf.d/mod_cluster.conf conf.d/mod_cluster.conf.example

# Reuse jboss user
RUN sed -i "s|User apache|User jboss|" conf/httpd.conf
RUN sed -i "s|Group apache|Group jboss|" conf/httpd.conf

# Add the launch script which configures the container
# on boot and launches HTTPD
ADD launch.sh /opt/jboss/ews/httpd/

ADD mod_cluster.conf /opt/jboss/ews/httpd/conf.d/
# remove Advertise because no upd
RUN sed -i "s|ServerAdvertise|#ServerAdvertise|" conf.d/mod_cluster.conf

RUN /opt/jboss/ews/httpd/.postinstall

CMD ["/opt/jboss/ews/httpd/launch.sh"]
