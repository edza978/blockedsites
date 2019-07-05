#!/bin/bash
read -p "Blocked URL:" u
U=$(echo ${u} | sed 's|http://||g; s|https://||g')
echo "address=/${U}/127.0.0.1" >> local.conf

#  clean duplicate sites
sort local.conf | uniq > /tmp/.blocked.tmp
mv /tmp/.blocked.tmp local.conf
echo "=> Total Blocked Domains: <="
wc -l local.conf
