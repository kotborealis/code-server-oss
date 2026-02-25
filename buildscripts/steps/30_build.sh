#!/bin/sh

set -ex

# Compile
node --max-old-space-size=6144 ./node_modules/gulp/bin/gulp.js vscode-reh-web-linux-x64
