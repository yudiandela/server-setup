#!/bin/bash
clear;

# Yudi Andela <yudhi.andhela@gmail.com>

echo "Menyiapkan penginstalan framework Codeigniter : ";
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
sudo chmod -R 755 "/var/www/$path_dir";
sudo chown -R $USER:$USER "/var/www/$path_dir";

cd /var/www/$path_dir;

## Install Menggunakan composer
composer create-project codeigniter4/appstarter . --remove-vcs --prefer-dist;
