FROM	alpine

# install nginx shell cmd and openssl
RUN		apk update && apk upgrade && apk add --no-cache nginx openssl

# nginx SSL setup
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/mababou.pem \
        -keyout /etc/nginx/ssl/mababou.key \
		-subj "/C=FR/ST=IDF/L=Paris/O=42_Paris/OU=FR/CN=mababou.42.fr"


# nginx config
RUN mkdir -p /var/www/html
COPY conf/nginx.conf /etc/nginx/http.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]