FROM gliderlabs/alpine:latest

RUN apk add --update \
    ffmpeg \
    nginx \
  && mkdir -p /tmp/hls \
  && rm -rf /var/cache/apk/*

ADD nginx.conf /etc/nginx/nginx.conf
ADD stat.xsl /etc/nginx/stat.xsl

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/log/nginx"]

WORKDIR /etc/nginx

EXPOSE 80 1935

CMD ["nginx"]
