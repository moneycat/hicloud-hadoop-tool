#!/bin/bash

ETC_HOSTS="/etc/hosts"

# gen /etc/hosts
echo -e "127.0.0.1\tlocalhost" > $ETC_HOSTS
echo -e  "210.61.10.151\tkdc.cht.local" >> $ETC_HOSTS
awk -F '\t' 'BEGIN{t=0} {print $1"\tnode"t; t+=1}' password >> $ETC_HOSTS
sed -i 's:node0:master:' $ETC_HOSTS

# gen slaves and includes
grep "node" $ETC_HOSTS | awk -F '\t' '{print $2}' > /etc/hadoop/conf/slaves
cp /etc/hadoop/conf/slaves /etc/hadoop/conf/includes
