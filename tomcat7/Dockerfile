FROM docker-registry.usersys.redhat.com/goldmann/jboss-base-jdk

MAINTAINER Jean-Frederic Clere jclere@redhat.com

# Install required software to run JBoss EWs
USER root
RUN yum -y install apr-util openssl mailcap hostname && yum clean all

# Expose the ports
EXPOSE 8080
EXPOSE 8009

# Version of the EWS distribution
ENV JBOSS_EWS_VERSION_MAJOR 2
ENV JBOSS_EWS_VERSION_MINOR 1
ENV JBOSS_EWS_VERSION_MICRO 0
ENV JBOSS_EWS_VERSION $JBOSS_EWS_VERSION_MAJOR.$JBOSS_EWS_VERSION_MINOR.$JBOSS_EWS_VERSION_MICRO

# Download the EWS distribution and unpack it
RUN curl http://download.devel.redhat.com/released/JBossEWS/$JBOSS_EWS_VERSION/jboss-ews-application-servers-$JBOSS_EWS_VERSION-RHEL7-x86_64.zip -o ews.zip && unzip -q ews.zip && rm ews.zip && mv jboss-ews-$JBOSS_EWS_VERSION_MAJOR.$JBOSS_EWS_VERSION_MINOR ews

# Specify the workdir
WORKDIR /opt/jboss/ews/tomcat7

# Add the launch script which configures the container
ADD launch.sh /opt/jboss/ews/tomcat7/
RUN chmod a+x /opt/jboss/ews/tomcat7/launch.sh

# The JAVA_HOME is set in jboss-base-jdk image.
CMD ["/opt/jboss/ews/tomcat7/launch.sh"]
