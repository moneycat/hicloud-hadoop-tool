#!/bin/bash

grep "node" /etc/hosts | xargs -n 2 echo | awk -F ' ' '{print "ssh "$1" \"sed -i \\\"s:HOSTNAME=.*:HOSTNAME="$2":\\\" /etc/sysconfig/network; hostname "$2"\""}' > 06updHosts.sh
