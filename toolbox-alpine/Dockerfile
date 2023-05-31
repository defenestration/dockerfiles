FROM alpine:latest
# https://github.com/alpine-docker/k8s/blob/master/Dockerfile 
ARG KUBECTL_VERSION=1.27.1
ARG ARCH=amd64

# add 'testing' repos (kubectl

RUN apk update && \
    apk add --no-cache \
    bash \
    vim \
    less \
    curl \
    git \
    wget \
    yq \
    jq \
    bind-tools \
    openssh-client \
    cifs-utils \
    netcat-openbsd 

RUN ln -s /etc/profile.d/color_prompt.sh.disabled /etc/profile.d/color_prompt.sh

# Install kubectl
RUN echo $ARCH && \
    curl -sLO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

ENTRYPOINT ["bash"]
