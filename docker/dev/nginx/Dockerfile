FROM nginx:1.18.0-alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY ./docker/dev/nginx/nginx.conf /etc/nginx/conf.d/
