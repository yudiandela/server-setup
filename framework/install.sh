#!/bin/bash
clear

# Yudi Andela <yudhi.andhela@gmail.com>

echo -e "----------------------------------------------------------------";
echo -e "- PHP FRAMEWORK                                                -";
echo -e "----------------------------------------------------------------";
echo -e "- [1]  Laravel                                                 -";
echo -e "- [2]  Codeigniter                                             -";
echo -e "----------------------------------------------------------------";
read -p "Pilihan anda antara [1 - 2] : " choice;

case $choice in
1)  echo "Install framework Laravel"
    ## Install Framework laravel
    framework/laravel.sh
    ;;
2)  echo "Install Codeigniter"
    ## Install Framework laravel
    framework/codeigniter.sh
    ;;
esac
