FROM alpine:latest
# add 'testing' repos (kubectl
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

RUN apk update && \
    apk add \
    bash \
    vim \
    less \
    curl \
    git \
    wget \
    yq \
    jq \
    bind-tools \
    kubectl \
    zsh 

ENTRYPOINT zsh
