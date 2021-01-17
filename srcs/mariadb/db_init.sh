#!/bin/sh

FLAG="$(echo 'SHOW DATABASES;exit;' | mysql | grep anclarma)"

if [ -z "$FLAG" ] ; then 
	/etc/init.d/mariadb setup 
 	sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf ;	
 	service mariadb start ;	
	echo "CREATE DATABASE IF NOT EXISTS anclarma;" | mysql -u root ;	
	echo "GRANT ALL PRIVILEGES ON anclarma.* TO 'anclarma'@'%' IDENTIFIED BY 'anclarma' ;" | mysql -u root ;	
	echo "FLUSH PRIVILEGES;" | mysql -u root ;	
 	mysql -u root < wordpress.sql;
fi 
tail -f /dev/null

