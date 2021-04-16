#we wait for mysql to be ready
until mysql
do
    echo ""
done

# we initialize the database
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* to 'admin'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

