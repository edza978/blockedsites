#!/bin/bash
read -p "Blocked URL:" u
U=$(echo ${u} | sed 's|http://||g; s|https://||g')
echo ${U} >> ads.conf
