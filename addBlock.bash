#!/bin/bash
# Script which add new blocked domains in the ads.conf
# file used by:
#  https://hub.docker.com/r/edza78/dnsmasq
# Created by: Edier Zapata <edza978 at gmail dot com>
#

read -p "Blocked URL: " url
Url=$(echo ${url} | sed 's|http://||g; s|https://||g')
Domain=$(echo ${Url} | cut -d/ -f1)
echo "address=/${Domain}/127.0.0.1" >> ads.conf

#  clean duplicate sites
sort ads.conf | uniq > /tmp/.blocked.tmp
mv /tmp/.blocked.tmp ads.conf
echo "=> Total Blocked Domains: <="
wc -l ads.conf
