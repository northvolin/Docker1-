FROM nginx
WORKDIR /home/
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./Hello.c /home/
COPY ./run.sh /home/
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    rm -rf /var/lib/apt/lists/*;
ENTRYPOINT ["sh", "run.sh"]
