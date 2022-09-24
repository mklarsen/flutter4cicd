FROM nginx:stable

WORKDIR /app

RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa

RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/app/flutter/bin"


#ARG BACKEND_APIURL
#ENV BACKEND_APIURL ${BACKEND_APIURL}
#ARG BACKEND_APIKEY
#ENV BACKEND_APIKEY ${BACKEND_APIKEY}

#COPY ./nginx.conf /etc/nginx/conf.d/default.conf
#COPY ./build/web /usr/share/nginx/html

COPY . .

#EOF
