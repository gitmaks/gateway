FROM nginx:1.19.7
RUN rm /etc/nginx/conf.d/default.conf && \
cat <<EOF > /etc/nginx/conf.d/server.conf
http   {

upstream server_group   {

server nginx-service-blue.blue.svc.cluster.local weight=BLUE-WEIGHT;

server nginx-service-green.green.svc.cluster.local weight=GREEN-WEIGHT;

}
server {
  listen 80;
  location / {
    proxy_pass "http:server_group";
    proxy_buffering off;
}
}
EOF
