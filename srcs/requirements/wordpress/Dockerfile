FROM	alpine:3.14


RUN		apk update --no-cache && \
    apk add php php7-fpm php7-mysqli \
	php7-json php7-phar php7-iconv php7-mbstring mariadb-client \
	redis

RUN		sed -i 's/listen = 127\.0\.0\.1:9000/listen = 9000/g' /etc/php7/php-fpm.d/www.conf

COPY	tools/wp_config.sh /usr/local/bin/

EXPOSE	9000

ENTRYPOINT ["wp_config.sh"]

CMD ["php-fpm7", "-F"]
