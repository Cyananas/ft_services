
nohup sh init_mysql.sh &

sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
sed -i 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/g' /etc/my.cnf.d/mariadb-server.cnf

# initialize mariadb data directory and table

/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"

#start mysql with safe option

/usr/bin/mysqld_safe --datadir="/var/lib/mysql"

