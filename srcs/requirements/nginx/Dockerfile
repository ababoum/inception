FROM	alpine:3.15

# install nginx shell cmd and openssl
RUN		apk update && apk upgrade && apk add --no-cache nginx openssl

# nginx SSL setup
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/mababou.pem \
        -keyout /etc/nginx/ssl/mababou.key \
		-subj "/C=FR/ST=IDF/L=Paris/O=42_Paris/OU=FR/CN=mababou.42.fr"


# nginx config
COPY ./conf/ /conf/

RUN adduser -D -g 'www' www && \
	mkdir -p /run/nginx && \
	mv /conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]