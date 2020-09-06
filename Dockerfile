FROM alpine:latest

LABEL maintainer="Wells <wellsgz@hotmail.com>"

ENV PORT=80

WORKDIR /root

RUN apk add --no-cache libressl curl \
    && rm -rf /var/lib/apt/lists/* \
    && curl -OL https://github.com/pymumu/smartdns/releases/download/Release32/smartdns.1.2020.08.27-2335.x86_64-linux-all.tar.gz \
    && tar zxfv smartdns.1.2020.08.27-2335.x86_64-linux-all.tar.gz \
    && cp /root/smartdns/usr/sbin/smartdns /usr/local/bin \
    && cp /root/smartdns/etc/smartdns/smartdns.conf /etc \
    && rm -rf /root/*

COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
