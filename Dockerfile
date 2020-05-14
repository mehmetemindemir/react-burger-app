FROM alpine
EXPOSE 3001
ADD ./config/default.conf /etc/nginx/conf.d/default.conf
COPY . /var/www/localhost/htdocs

RUN apk add nginx && \
    mkdir /run/nginx && \
    apk add nodejs && \
    apk add yarn && \
    cd /var/www/localhost/htdocs && \
    rm -rf node_modules && \
    yarn install && \
    yarn run build;


CMD ["/bin/sh", "-c", "exec nginx -g 'daemon off;';"]
WORKDIR /var/www/localhost/htdocs

