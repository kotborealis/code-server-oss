#!/bin/sh

set -ex

# Electron and browsers are not required
# for code-server build.
export ELECTRON_SKIP_BINARY_DOWNLOAD=1
export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

# Install deps

# Remove telemetry libs
sed -i -e 's#"@vscode/telemetry-extractor": "^1.9.8",##g' package.json

# Remove ripgrep, which, for SOME reason,
# cannot be installed in this case due to proxies.
sed -i -e 's#"@vscode/ripgrep": "^1.14.2",##g' package.json

yarn config set ignore-engines true

# Install node_modules
yarn $@

# Install ripgrep.
# Now it works, no one knows exactly why.
yarn add @vscode/ripgrep
