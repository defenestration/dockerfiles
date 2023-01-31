FROM mcr.microsoft.com/azure-cli:latest

#COPY --from=0 /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/kubectl
#RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" ; install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN az aks install-cli
