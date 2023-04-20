FROM node:16-buster as builder

ARG REVISION
ARG HTTP_PROXY
ARG HTTPS_PROXY

# Build deps
RUN apt-get update && \
    apt-get install -y \
        libxkbfile-dev \
        pkg-config \
        libsecret-1-dev \
        libxss1 \
        dbus \
        xvfb \
        libgtk-3-0 \
        libgbm1

# Proxy is only needed during git clone and yarn
ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY
ARG VSCODE_TAG=master

# vscode dist
RUN git clone --progress --filter=tree:0 https://github.com/microsoft/vscode.git --branch=${VSCODE_TAG:-master} ./vscode
WORKDIR vscode

# Build
RUN mkdir -p ./buildscripts/steps/
COPY ./buildscripts/install_deps.sh ./buildscripts/

COPY ./buildscripts/steps/10_deps.sh ./buildscripts/steps/
RUN bash ./buildscripts/steps/10_deps.sh

COPY ./buildscripts/steps/20_patch.sh ./buildscripts/steps/
RUN bash ./buildscripts/steps/20_patch.sh

COPY ./buildscripts/steps/30_build.sh ./buildscripts/steps/
RUN bash ./buildscripts/steps/30_build.sh

COPY ./buildscripts/steps/40_postbuild.sh ./buildscripts/steps/
RUN bash ./buildscripts/steps/40_postbuild.sh

FROM node:16-buster
COPY --from=builder /code-server-oss /code-server-oss
WORKDIR /code-server-oss

COPY ./extensions/ ./extensions/

# Entrypoint
COPY ./buildscripts/entrypoint.sh ./
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
