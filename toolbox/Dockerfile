FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
RUN apt update -y ; \
    apt install -yq --no-install-recommends \
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
    netcat \
    nmap \
    socat \
    tcpdump \
    traceroute \
    vim \
    wget \
    cifs-utils \
    postgresql-client \
    && apt clean

# RUN apt install -yq bpfcc-tools python3-bpfcc bpftrace

# kubectl repository
#https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management
RUN mkdir -p /etc/apt/keyrings && curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list && \
    apt update -y && apt install kubectl && apt clean

# yq
RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && \
    chmod +x /usr/bin/yq

# dotnet tools 
RUN wget https://aka.ms/dotnet-dump/linux-x64 -O /usr/local/bin/dotnet-dump && chmod +x /usr/local/bin/dotnet-dump && \
    wget https://aka.ms/dotnet-gcdump/linux-x64 -O /usr/local/bin/dotnet-gcdump && chmod +x /usr/local/bin/dotnet-gcdump

# azure cli
# RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash && apt clean

# homebrew
#RUN apt install -yq \
#    git build-essential procps file ;\
#    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#color prompt
ENV force_color_prompt=yes

ENTRYPOINT /bin/bash
