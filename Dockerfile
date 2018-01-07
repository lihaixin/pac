#
# Dockerfile for PAC
# https://github.com/txthinking/pac
#
FROM golang:alpine3.7

RUN  set -ex \
      && apk -U add git bash \
      && go get github.com/txthinking/pac \
      && apk del git \
      && rm -rf /var/cache/apk/*

ENV WHITE	/go/src/github.com/txthinking/pac/white.list
ENV BLACK	/go/src/github.com/txthinking/pac/black.list
ENV MAP	/go/src/github.com/txthinking/pac/customize.map
ENV CYCLE	3600

EXPOSE 1901

CMD pac \
           --listen :1901 \
           --white $WHITE \
           --black  $BLACK  \
           --customize $MAP \
           --cycle $CYCLE



