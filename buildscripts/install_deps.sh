#!/bin/sh

set -ex

# Electron and browsers are not required
# for code-server build.
export ELECTRON_SKIP_BINARY_DOWNLOAD=1
export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

# Pre-cache ripgrep to avoid GitHub API rate limits during npm install.
RIPGREP_PKG_VERSION="$(node -p "require('./package-lock.json').packages['node_modules/@vscode/ripgrep'].version")"
RIPGREP_CACHE_DIR="/tmp/vscode-ripgrep-cache-${RIPGREP_PKG_VERSION}"
mkdir -p "${RIPGREP_CACHE_DIR}"

ARCH="$(uname -m)"
case "${ARCH}" in
    x86_64) RG_TARGET="x86_64-unknown-linux-musl" ;;
    aarch64) RG_TARGET="aarch64-unknown-linux-musl" ;;
    armv7l|arm) RG_TARGET="arm-unknown-linux-gnueabihf" ;;
    ppc64le) RG_TARGET="powerpc64le-unknown-linux-gnu" ;;
    riscv64) RG_TARGET="riscv64gc-unknown-linux-gnu" ;;
    s390x) RG_TARGET="s390x-unknown-linux-gnu" ;;
    i386|i686) RG_TARGET="i686-unknown-linux-musl" ;;
    *) RG_TARGET="x86_64-unknown-linux-musl" ;;
esac

RG_VERSION="v15.0.0"
if [ "${RG_TARGET}" = "arm-unknown-linux-gnueabihf" ] || \
   [ "${RG_TARGET}" = "powerpc64le-unknown-linux-gnu" ] || \
   [ "${RG_TARGET}" = "s390x-unknown-linux-gnu" ]; then
    RG_VERSION="v13.0.0-4"
fi

RG_ASSET="ripgrep-${RG_VERSION}-${RG_TARGET}.tar.gz"
RG_ASSET_PATH="${RIPGREP_CACHE_DIR}/${RG_ASSET}"
if [ ! -f "${RG_ASSET_PATH}" ]; then
    curl -fsSL \
        "https://github.com/microsoft/ripgrep-prebuilt/releases/download/${RG_VERSION}/${RG_ASSET}" \
        -o "${RG_ASSET_PATH}"
fi

# Install node_modules
npm ci "$@"
