FROM	alpine

RUN		apt-get update

EXPOSE	433/tcp

VOLUME	/home/login/data/

USER	mababou:sudo
USER	test_user

CMD		["echo", "Hello"]

ENTRYPOINT ["nginx", "-g", "daemon off;"]