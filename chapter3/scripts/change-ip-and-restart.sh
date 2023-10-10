#!/bin/bash

ip=$1
netmask=$2

change_ip_and_restart() {
    echo "Waiting 120 seconds before changing ip and netmask"
    sleep 120
    echo "Changing ip to $ip and netmask to $netmask"
    sudo ifconfig eth0 $ip netmask $netmask
    sudo service networking restart
    echo "Defining static ip under /etc/network/interfaces to avoid ip change after reboot"
    sudo echo -e "auto eth0\niface eth0 inet static\n    address $ip\n    netmask $netmask" > /etc/network/interfaces
}

echo "Starting change_ip_and_restart in background"
echo "This script will change ip to $ip and netmask to $netmask after 120 seconds"

change_ip_and_restart &
echo "Exiting script, but change_ip_and_restart will continue in background"