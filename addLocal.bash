#!/bin/bash
# Script which add new record in the local.conf
# file used by:
#  https://hub.docker.com/r/edza78/dnsmasq
# Created by: Edier Zapata <edza978 at gmail dot com>
#

read -p "Domain to Add: " u
U=$(echo ${u} | sed 's|http://||g; s|https://||g')

read -p "IP to redirect ${U} [Use 127 to block domain]: " ip
if [ ${ip} == "127" ]; then
 echo "address=/${U}/127.0.0.1" >> local.conf
else
 echo "address=/${U}/${ip}" >> local.conf
fi

#  clean duplicate sites
sort local.conf | uniq > /tmp/.blocked.tmp
mv /tmp/.blocked.tmp local.conf
echo "=> Total Local Domains: <="
wc -l local.conf
