/usr/sbin/php-fpm7

# install wp-cli to manage wordpress via "wp" command
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

cd var/www/wordpress

# install wordpress
wp core install --url=http://172.17.0.3:5050 --title=ft_services --admin_user=pravry --admin_password=pravry --admin_email=pravry@example.com;

wp user create master master@example.com        --role=author       --user_pass=master
wp user create student1 student1@example.com    --role=contributor  --user_pass=student1
wp user create student2 student2@example.com    --role=contributor  --user_pass=student2

nginx -g "daemon off;"
