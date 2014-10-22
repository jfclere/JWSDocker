#!/bin/bash
sed -i "/SHUTDOWN/a <Listener className=\"org.jboss.modcluster.container.catalina.standalone.ModClusterListener\" ProxyList=\"${WEB_PORT_6666_TCP_ADDR}:${WEB_PORT_6666_TCP_PORT}\"/>" /opt/jboss/ews/tomcat7/conf/server.xml
/opt/jboss/ews/tomcat7/bin/startup.sh
tail -f /opt/jboss/ews/tomcat7/logs/catalina.out
