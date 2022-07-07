FROM	alpine:3.15

# install php tools to use the adminer.php file
RUN apk update
RUN apk add vim
RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
	php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
	php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7 php7-fpm php7-opcache php7-session

# get the adminer.php file and place it in the container web source
RUN		mkdir -p /var/www/html/
COPY	tools/adminer-4.8.1.php /var/www/html/index.php

RUN		chown -R 1000:1000 /var/www/html/index.php && \
		chmod 755 /var/www/html/index.php

EXPOSE 8080

CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www/html" ]