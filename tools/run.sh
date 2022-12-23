#! /usr/bin/env bash

set -ex

# Get project root dir
ROOT="$( cd "$( dirname "$(readlink -f ${BASH_SOURCE[0]})" )" && cd ../ && pwd )"

export NODE=$ROOT/data/node/bin/node
cd $ROOT/data/vscode/
./entrypoint.sh $@