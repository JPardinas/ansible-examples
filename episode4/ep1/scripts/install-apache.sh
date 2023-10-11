#!/bin/bash

# Install Apache on ubuntu
sudo apt update -y
sudo apt install apache2 -y

# Copy configuration files
sudo cp /vagrant/config/apache2.conf /etc/apache2/apache2.conf
sudo cp /vagrant/config/ports.conf /etc/apache2/ports.conf
sudo cp /vagrant/config/000-default.conf /etc/apache2/sites-available/000-default.conf

# Start Apache and enable it to start on boot
sudo systemctl start apache2
sudo systemctl enable apache2
