#!/bin/bash

# Install Apache
# added 'ServerName 127.0.0.1' to the bottom of /etc/apache2/apache2.conf
# sudo apt-get update
# sudo apt-get install apache2 -y

# Install PHP
# sudo apt-get install python-software-properties software-properties-common
# sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
# sudo apt-get update
# sudo apt-get remove php5-common -y
# sudo apt-get purge php5-common -y
# sudo apt-get install php7.0 php7.0-fpm php7.0-mysql php7.0-xml -y

# Install MySQL
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
# sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
# sudo apt-get -y install mysql-server

# Setup app environment
php bin/console server:start 0.0.0.0:8000
# sudo systemctl restart apache2
php bin/console doctrine:database:create --if-not-exists
php composer.phar install
php bin/console doctrine:migrations:migrate

# Setup backup db location
# cd /opt
# sudo mkdir backups
# cd backups
# sudo mkdir database
# cd database
# sudo chmod 777 ./