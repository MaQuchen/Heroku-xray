FROM alpine:edge

RUN apk update
RUN apk add --no-cache ca-certificates caddy wget
RUN wget -qO- https://github.com/MaQuchen/Heroku-xray/raw/master/app/Xray-linux-64.zip | busybox unzip
RUN chmod +x /xray
RUN /xray version
RUN rm -rf /var/cache/apk/

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
