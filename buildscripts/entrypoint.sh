#! /usr/bin/env bash

set -ex

# Get project root di
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export NODE=${NODE:-$ROOT/node/bin/node}

export NODE_ENV=development
export VSCODE_DEV=1

code_server () {
  $NODE $ROOT/scripts/code-server.js $@
}

echo "Preinstalling extensions..."
for file in $(find $ROOT/vscode/extensions -name '*.vsix'); do
  echo "Installing $file"
  code_server --install-extension $file
done

echo "Starting server with args: $@"
code_server $@
