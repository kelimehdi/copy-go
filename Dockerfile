FROM alpine:latest as builder

RUN apk update &&\
    apk upgrade &&\
    apk add go git make

COPY / /tmp

WORKDIR /tmp

ENTRYPOINT ["make" ,"build"]
