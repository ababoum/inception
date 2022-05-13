#! /bin/sh

# wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /bin/wp
# chmod +x /bin/wp

mkdir -p /var/www/html
chmod -R 755 /var/www/html
chown -R 1000:1000 /var/www/html

rm -f /var/www/html/wp-config.php
rm -f /var/www/html/wp-config-sample.php

wp core download --path=/var/www/html/ --locale=fr_FR
wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost="$DB_HOST" --path=/var/www/html/
wp core install --url="$DOMAIN_NAME" --title="$TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_MAIL" --path="/var/www/html"
wp user create $WP_USER $WP_USER@$DOMAIN_NAME --role="author" --user_pass="$WP_PASSWORD" --path="/var/www/html"
