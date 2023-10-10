#!/bin/bash

isController=$1

mkdir -p /vagrant/outputs

if [ ! -f /vagrant/outputs/control.pub ]; then
	echo "Creating master key for the first time"
    ssh-keygen -t rsa -N "" -f /vagrant/outputs/control
fi

cat /vagrant/outputs/control.pub >> /home/vagrant/.ssh/authorized_keys

if [ "$isController" = true ]; then
    echo "Copying control private key to master node"
	cp /vagrant/outputs/control /home/vagrant/.ssh/id_rsa
	chmod 400 /home/vagrant/.ssh/id_rsa
	chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
fi
