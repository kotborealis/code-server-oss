#!/bin/sh

set -ex

# Compile
export VSCODE_NO_SOURCEMAP=1
node --max-old-space-size=3072 ./node_modules/gulp/bin/gulp.js vscode-reh-web-linux-x64
