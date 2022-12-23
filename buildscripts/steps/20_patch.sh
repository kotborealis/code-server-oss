#!/bin/sh

set -ex

# Prevent electron build
cat build/lib/preLaunch.js \
    | grep -v "await getElectron();" \
    | grep -v "await getBuiltInExtensions();" \
    > build/lib/preLaunch.server.js
