FROM alpine:latest

ARG hugo-version=0.32.3

RUN apk add --no-cache tar curl

RUN curl https://github.com/gohugoio/hugo/releases/download/v${hugo-version}/hugo_${hugo-version}_Linux-64bit.tar.gz \
    && mkdir hugo_binary \
    && tar -C hugo_binary -xf hugo_${hugo-version}_Linux-64bit.tar.gz \
    && mv hugo_binary/hugo /usr/bin/hugo \
    && rm -rf hugo_${hugo-version}_Linux-64bit.tar.gz hugo_binary \
    && hugo version

WORK_DIR /root

CMD ["sh"]