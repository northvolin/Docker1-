FROM nginx
WORKDIR /home/
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./Hello.c /home/
COPY ./run.sh /home/
USER root
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    chown -R nginx:nginx /etc/nginx/nginx.conf && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /home && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    rm -rf /var/lib/apt/lists/*;
USER nginx
RUN chmod +x /home/run.sh
ENTRYPOINT ["/home/run.sh"]
