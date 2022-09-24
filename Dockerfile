FROM nginx:stable

ARG BACKEND_APIURL
ENV BACKEND_APIURL ${BACKEND_APIURL}

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./build/web ./usr/share/nginx/html/
