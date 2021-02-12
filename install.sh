#!/bin/bash
clear

# Yudi Andela <yudhi.andhela@gmail.com>

# Program ini untuk memudahkan penginstalan aplikasi pendukung pada saat
# setup server dan dapat digunakan untuk personal ataupun komersial.

if [ ! -f "SETUP_MY_SERVER" ];
then
    ## Update Server
    sudo apt-get update;

    ## Install software-properties-common
    sudo apt -y install software-properties-common;

    touch SETUP_MY_SERVER;
fi

again='y'
while [[ $again == 'Y' ]] || [[ $again == 'y' ]];
do
    clear
    echo -e "\e[1;32m******************************************************************\e[0m";
    echo -e "\e[1;32m*                         SETUP MY SERVER                        *\e[0m";
    echo -e "\e[1;32m******************************************************************\e[0m";
    echo -e "* [1]  Install PHP 8.0                                           *";
    echo -e "* [2]  Install GIT                                               *";
    echo -e "* [3]  Install PHP Framework [Laravel]                           *";
    echo -e "* [4]  Pengaturan Domain                                         *";
    echo -e "* [5]  Aktifkan SSL                                              *";
    echo -e "* [6]  Install Composer                                          *";
    echo -e "* [7]  Keluar                                                    *";
    echo -e "\e[1;32m******************************************************************\e[0m";

    read -p " Masukkan Nomor Pilihan Anda antara [1 - 7] : " choice;
    echo "";
    case $choice in
    1)  echo "Install PHP 8.0"
        # Add repository php
        sudo add-apt-repository -y ppa:ondrej/php

        # Install php8.0
        sudo apt -y install php8.0-fpm php8.0-common php8.0-mysql php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-intl
        echo -e "\e[1;32mInstall PHP 8.0 Selesai \e[0m"
        ;;
    2)  echo "Install GIT"
        ## Add repository git
        sudo add-apt-repository -y ppa:git-core/ppa

        ## Install GIT
        sudo apt -y install git
        echo -e "\e[1;32mInstall GIT Selesai \e[0m"
        ;;
    3)  echo "Install PHP Framework [Laravel]"
        ## Install Framewwork laravel
        framework/laravel.sh
        echo -e "\e[1;32mInstall PHP Framework [Laravel] Selesai \e[0m"
        ;;
    4)  echo "Pengaturan Domain"
        ## Setting Domain
        config/domain.sh
        echo -e "\e[1;32mPengaturan Domain Selesai \e[0m"
        ;;
    5)  echo "Aktifkan SSL"
        echo -e "\e[1;32mAktifkan SSL Selesai \e[0m"
        ;;
    6)  echo "Install Composer"
        ## Install latest composer
        sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
        sudo php composer-setup.php --install-dir=/usr/bin --filename=composer
        sudo php -r "unlink('composer-setup.php');"
        echo -e "\e[1;32mInstall Composer Selesai \e[0m"
        ;;
    7) exit;
        ;;
    *)  echo "Maaf, menu tidak ada";
    esac
    echo "";
    echo "Setup My Server for nginx server (Ubuntu Server)";
    echo "Yudi Andela <yudhi.andhela@gmail.com>";
    echo "";
    echo -n "Kembali ke menu? [y/n]: ";
    read again;
    while [[ $again != 'Y' ]] && [[ $again != 'y' ]] && [[ $again != 'N' ]] && [[ $again != 'n' ]];
    do
        echo "Masukkan yang anda pilih tidak ada di menu";
        echo -n "Kembali ke menu? [y/n]: ";
        read again;
    done
done
echo -e "\e[1;32m******************************************************************\e[0m";
echo -e "\e[1;32m*                   PENGATURAN SERVER SELESAI                    *\e[0m";
echo -e "\e[1;32m******************************************************************\e[0m";
