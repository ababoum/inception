FROM	alpine:3.14

ARG DB_CLIENT
ARG DB_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_PASSWORD

# install mariadb (mysql)
RUN apk update --no-cache && \
	apk add mariadb mariadb-client

# initialize a first database with the user 'mysql'
RUN sed -i "7i user=mysql\ndatadir=/var/lib/mysql/" /etc/my.cnf.d/mariadb-server.cnf && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal && \
	mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld

RUN echo "[mysqld]" > /etc/my.cnf.d/mariadb-server.cnf && \
		echo "user = mysql" >> /etc/my.cnf.d/mariadb-server.cnf && \
		echo "datadir = /var/lib/mysql/" >> /etc/my.cnf.d/mariadb-server.cnf && \
		echo "port = 3306" >> /etc/my.cnf.d/mariadb-server.cnf && \
		echo "bind-address = 0.0.0.0" >> /etc/my.cnf.d/mariadb-server.cnf && \
		echo "skip-networking = false" >> /etc/my.cnf.d/mariadb-server.cnf

# create a database for WordPress with the user 'mababou'
RUN mysqld & \
		sleep 5 && \
		echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql && \
		echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql && \
		echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" | mysql && \
		echo "FLUSH PRIVILEGES;" | mysql && \
		echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql

EXPOSE	3306

CMD		["mysqld"]