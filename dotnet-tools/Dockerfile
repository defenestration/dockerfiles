# https://github.com/dodopizza/kubectl-shovel/blob/master/dumper/Dockerfile

#FROM dodopizza/kubectl-shovel-dumper:v0.7.0 as dumper

FROM mcr.microsoft.com/dotnet/sdk:8.0-bookworm-slim  as tools-install

RUN dotnet tool install -g dotnet-gcdump && \
    dotnet tool install -g dotnet-trace && \
    dotnet tool install -g dotnet-dump

FROM mcr.microsoft.com/dotnet/runtime:8.0.3-bookworm-slim

ARG DOTNET_TOOLS_PATH="/root/.dotnet/tools"
ARG DOTNET_RUNTIME_PATH="/usr/share/dotnet/shared/Microsoft.NETCore.App/8.0.3"
ENV PATH="${PATH}:${DOTNET_TOOLS_PATH}:${DOTNET_RUNTIME_PATH}"

WORKDIR /app
COPY --from=tools-install ${DOTNET_TOOLS_PATH} ${DOTNET_TOOLS_PATH}
#COPY --from=dumper /app/dumper /app/

#ENTRYPOINT [ "/app/dumper" ]
