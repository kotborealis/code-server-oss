#! /usr/bin/env bash

set -ex

# Get project root di
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../ && pwd )"

# Recreate ./dist directory
rm -rf $ROOT/dist
mkdir  $ROOT/dist

# Build image
docker-compose build

# Extract bundle
docker run --rm --entrypoint tar kotborealis/code-server-oss:latest -cz /vscode > $ROOT/dist/bundle.tar.gz
