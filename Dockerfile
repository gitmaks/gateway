FROM nginx:1.20.0-alpine
COPY nginx-reload.sh /opt/nginx-reload.sh
RUN apk update  &&  apk add inotify-tools bash tini && \
rm /etc/nginx/conf.d/default.conf && \
chmod +x  /opt/nginx-reload.sh

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/opt/nginx-reload.sh"]
