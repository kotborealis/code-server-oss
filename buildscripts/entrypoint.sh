#! /usr/bin/env bash

set -ex

# Get project root di
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export NODE=$(find ${ROOT}/.build/ -name 'node' -type f -executable)

code_server () {
  $NODE $ROOT/out/server-main.js $@
}

echo "Preinstalling extensions..."
for file in $(find $ROOT/extensions -name '*.vsix'); do
  echo "Installing $file"
  code_server --install-extension $file
done

echo "Starting server with args: $@"
code_server $@
