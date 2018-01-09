FROM alpine:latest

ARG HUGOVERSION=0.32.3

RUN apk add --no-cache tar git && apk add --update wget

RUN wget -q https://github.com/gohugoio/hugo/releases/download/v${HUGOVERSION}/hugo_${HUGOVERSION}_Linux-64bit.tar.gz \
    && mkdir hugo_binary \
    && tar -C hugo_binary/ -xf hugo_${HUGOVERSION}_Linux-64bit.tar.gz \
    && mv hugo_binary/hugo /usr/bin/hugo \
    && rm -rf hugo_${HUGOVERSION}_Linux-64bit.tar.gz hugo_binary \
    && hugo version
    
RUN git config --global user.email "autodeploy@admin.com" \
    && git config --global user.name "autodeploy"

EXPOSE 1313

WORKDIR /root

CMD ["sh"]
