FROM	alpine

RUN		apk update && apk upgrade && apk add --no-cache nginx openssl

# EXPOSE	433/tcp
# VOLUME	/home/login/data/
# USER	mababou:sudo
# USER	test_user


# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/mababou.pem \
        -keyout /etc/nginx/ssl/mababou.key \
		-subj "/C=FR/ST=IDF/L=Paris/O=42_Paris/OU=FR/CN=mababou.42.fr"


# nginx config
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]