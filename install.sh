#!/bin/bash
clear

# Yudi Andela <yudhi.andhela@gmail.com>

# Program ini untuk memudahkan penginstalan aplikasi pendukung pada saat
# setup server dan dapat digunakan untuk personal ataupun komersial.

echo "===========================================================";
echo "                     Setup My Server                       ";
echo "===========================================================";
sudo apt-get update
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt -y install git
sudo apt -y install php8.0-fpm php8.0-common php8.0-mysql php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-intl
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer
sudo php -r "unlink('composer-setup.php');"
sudo cp -f default /etc/nginx/sites-available
sudo service nginx restart
echo "===========================================================";
echo "                         SELESAI                           ";
echo "===========================================================";
