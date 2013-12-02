#!/bin/bash

LIST=`awk -F '\t' '{print $1}' password`

for l in $LIST; do
	rsync -avz --delete /etc/hadoop-0.20/hadoop $l:/etc/hadoop-0.20/
	rsync -avz /etc/hosts $l:/etc/
	rsync -avz --delete /etc/ganglia/gmond.conf $l:/etc/ganglia/
done
