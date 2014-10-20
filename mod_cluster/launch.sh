#!/bin/sh

NETIP=`ifconfig eth0 | grep "inet " | awk '{ print $2 }' | awk 'BEGIN{FS="."}{print $1 "." $2 "." $3}'`
sed -i "s|127.0.0.1|${NETIP}|" $EWS_HOME/httpd/conf.d/mod_cluster.conf

exec $EWS_HOME/httpd/sbin/apachectl -DFOREGROUND
