#!/bin/bash

LIST=`grep "node" /etc/hosts | xargs -n 2 echo | awk -F ' ' '{print $2}'`

for l in $LIST; do
	ssh $l "alternatives --install /etc/hadoop-0.20/conf hadoop-0.20-conf /etc/hadoop-0.20/hadoop 60; mkdir -p /opt/hadoop/hdfs; mkdir -p /opt/hadoop/mapred; mkdir -p /var/run/hadoop-0.20/; mkdir -p /var/lib/hadoop-0.20/cache/; chown -R hdfs:hadoop /opt/hadoop; chown -R mapred:mapred /opt/hadoop/mapred; chown -R hdfs:hadoop /var/run/hadoop-0.20/; chgrp -R hadoop /var/lib/hadoop-0.20/cache/; chmod -R 777 /var/lib/hadoop-0.20/cache/"
	ssh $l "service hadoop-0.20-datanode restart; sleep 10; service hadoop-0.20-tasktracker restart" &
done
