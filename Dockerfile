FROM nginx:1.11-alpine

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init
ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

# install inotify
RUN apk update && apk add inotify-tools bash

COPY nginx-reload.sh /app/nginx-reload.sh
RUN chmod +x /app/nginx-reload.sh

EXPOSE 80 8080

CMD ["/app/nginx-reload.sh"]
