FROM alpine:3.7

MAINTAINER @iMerica <imerica@me.com>

RUN apk add --no-cache git make perl libgcc openssl build-base linux-headers && \
    git clone --branch 4.1.0 --depth 1 https://github.com/wg/wrk.git && \
    sed -i 's/no-idea/no-idea no-async/' ./wrk/Makefile && \
    make -C  ./wrk all && \
    mv ./wrk/wrk /usr/bin && \
    rm -rf ./wrk && \
    apk del git make perl openssl build-base linux-headers

ENTRYPOINT ["wrk"]

