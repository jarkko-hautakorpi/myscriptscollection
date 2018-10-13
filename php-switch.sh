#!/bin/bash
version=$(eval 'php -r "echo substr(phpversion(), 0, 3);";')
echo "PHP is now: $version"
if [ "$version" = "7.2" ]; then
    echo "Switch to PHP 5\n"
    sudo update-alternatives --set php /usr/bin/php5
    sudo a2dismod php7.2
    sudo a2enmod php5
else
    echo "Switch to PHP 7\n"
    sudo update-alternatives --set php /usr/bin/php7.2
    sudo a2dismod php5
    sudo a2enmod php7.2
fi
sudo service apache2 restart
sudo service mysql restart
