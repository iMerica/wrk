FROM bitnami/minideb:latest

MAINTAINER @iMerica <imerica@me.com>

RUN apt-get update -y && apt-get install -y git make perl gcc openssl && \
    git clone --branch 4.1.0 --depth 1 https://github.com/wg/wrk.git && \
    sed -i 's/no-idea/no-idea no-async/' ./wrk/Makefile && \
    make -C  ./wrk all && \
    mv ./wrk/wrk /usr/bin && \
    rm -rf ./wrk 

RUN apt-get purge -y git make perl gcc openssl

ENTRYPOINT ["wrk"]

