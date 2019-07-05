#!/bin/bash
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
