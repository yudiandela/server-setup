#!/bin/bash
clear;

echo "Menyiapkan penginstalan Laravel framework : ";
echo "";
echo -n "Directory penginstalan [/var/www] : ";
read path_dir;

if [ -d "/var/www/$path_dir" ];
then
    echo -n "/var/www/$path_dir sudah ada : timpa? [y/N] : ";
    read replace;

    if [ ! $replace ]; then
        replace="N";
        echo "Proses di batalkan";
        exit 0;
    elif [ $replace == "Y" ] || [ $replace == "y" ]; then
        sudo rm -rf "/var/www/$path_dir";
    fi
fi

## Membuat Directory
sudo mkdir "/var/www/$path_dir";

## Setting Permission
sudo chmod -R 777 "/var/www/$path_dir";
sudo chown -R $USER:$USER "/var/www/$path_dir";

cd /var/www/$path_dir;

## Install Menggunakan composer
composer create-project laravel/laravel . --remove-vcs --prefer-dist;

## Setting Permission
sudo chmod -R 755 storage;
sudo chmod -R 755 bootstrap;

## Setting Permission
sudo chown -R www-data:www-data storage;
sudo chown -R www-data:www-data bootstrap;
