#!/bin/bash
clear

# Yudi Andela <yudhi.andhela@gmail.com>

# Program ini untuk memudahkan penginstalan aplikasi pendukung pada saat
# setup server dan dapat digunakan untuk personal ataupun komersial.

again='y'
echo "===========================================================";
echo "                     SETUP MY SERVER                       ";
echo "===========================================================";

## Update Server
sudo apt-get update

## Install software-properties-common
sudo apt -y install software-properties-common

## Add repository php
sudo add-apt-repository -y ppa:ondrej/php

## Add repository git
sudo add-apt-repository -y ppa:git-core/ppa

## Update Server
sudo apt-get update

## Install GIT
sudo apt -y install git

## Install php8.0
sudo apt -y install php8.0-fpm php8.0-common php8.0-mysql php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-intl

## Install latest composer
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer
sudo php -r "unlink('composer-setup.php');"

## Setting Domain
./setting-domain.sh

## Restart nginx service
sudo service nginx restart

echo "===========================================================";
echo "                PENGATURAN SERVER SELESAI                  ";
echo "===========================================================";
