FROM bitnami/kubectl:1.23-debian-10
FROM mcr.microsoft.com/azure-cli:latest

COPY --from=0 /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/kubectl

