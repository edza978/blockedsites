#!/bin/bash
read -p "Blocked URL:" u
U=$(echo ${u} | sed 's|http://||g; s|https://||g')
echo "address=/${U}/127.0.0.1" >> ads.conf

#  clean duplicate sites
sort ads.conf | uniq > /tmp/.blocked.tmp
mv /tmp/.blocked.tmp ads.conf
echo "=> Total Blocked Domains: <="
wc -l ads.conf
