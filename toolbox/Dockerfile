FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
RUN apt update -y ; \
    apt install -yq \
    bash-completion \
    ca-certificates \
    curl \
    dnsutils \
    git \
    gnupg \
    iputils-ping \
    jq \
    less \
    mtr \
    net-tools \
    nmap \
    socat \
    tcpdump \
    traceroute \
    vim \
    wget \
    cifs-utils \
    && apt clean

# RUN apt install -yq bpfcc-tools python3-bpfcc bpftrace

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
    apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | \
    tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt update && apt install -y kubectl \
    && apt clean

# yq
RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && \
    chmod +x /usr/bin/yq


# azure cli
# RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash && apt clean

# homebrew
#RUN apt install -yq \
#    git build-essential procps file ;\
#    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

ENTRYPOINT /bin/bash
