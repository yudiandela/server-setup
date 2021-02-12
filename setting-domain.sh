#!/bin/bash

# Yudi Andela <yudhi.andhela@gmail.com>

# Setting Domain atau sub domain dengan default konfigurasi menggunakan server nginx

echo "";
echo -n "Lanjutkan ke pengaturan domain [Y/n] : ";
read next;

path_directory="/etc/nginx/sites-enabled";

if [ ! $next ]; then
    next="Y";
else
    while [[ $next != "Y" ]] && [[ $next != "y" ]] && [[ $next != "N" ]] && [[ $next != "n" ]];
    do
        echo "Keyword yang anda masukkan salah";
        echo -n "Lanjutkan ke pengaturan domain [Y/n] : ";
        read next;
    done
fi

while [ "$next" == "y" ] || [ "$next" == "Y" ];
do
    echo -n "Masukkan nama domain [cth: sub.domian.ku] : ";
    read domain;
    sudo cp -f default $domain;

    echo -n "Masukkan root directory [/var/www] : ";
    read root_path;

    sed -i "s|{domain_name}|$domain|g" $domain;
    sed -i "s|{root_path}|$root_path|g" $domain;

    ## Mengubah file konfigurasi nginx ke sites enabled
    sudo mv -f $domain $path_directory;

    echo "";
    echo -n "Masih ingin melanjutkan? [y/N] : ";
    read next;

    if [ ! $next ]; then
        next="N";
    else
        while [[ $next != "Y" ]] && [[ $next != "y" ]] && [[ $next != "N" ]] && [[ $next != "n" ]];
        do
            echo "";
            echo "Keyword yang anda masukkan salah";
            echo -n "Masih ingin melanjutkan? [y/N] : ";
            read next;

            if [ ! $next ]; then
                next="N";
            fi
        done
    fi
done

## Restart nginx service
sudo service nginx restart
