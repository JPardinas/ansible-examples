#!/bin/bash

findWord=$1
replaceFile=$2

# get ip address using ifconfig from eth0 interface, use cut to get everything after 'inet ' and awk to get the second column'
ip=$( ifconfig eth0 | grep "inet " | awk '{print $2}' )

# replace 
sed -i "s/$findWord/$ip/g" $replaceFile