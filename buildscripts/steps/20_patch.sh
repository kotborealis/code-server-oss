#!/bin/sh

set -ex

# Prevent electron build
cat build/lib/preLaunch.js \
    | grep -v "await getElectron();" \
    | grep -v "await getBuiltInExtensions();" \
    > build/lib/preLaunch.server.js

# Prevent builtin extensions from downloading
cat product.json
node -e 'console.log(JSON.stringify({...require("./product.json"), builtInExtensions: []}))' > product.json.tmp
mv product.json.tmp product.json
