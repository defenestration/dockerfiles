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
    openssh-client \
    cifs-utils \
    zsh ;\
    apk cache clean ;\
    ln -s /etc/profile.d/color_prompt.sh.disabled /etc/profile.d/color_prompt.sh

ENTRYPOINT bash
