#! /usr/bin/env bash

set -ex

# Get project root di
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../ && pwd )"

cd $ROOT/dist
wget https://nodejs.org/dist/v16.9.1/node-v16.9.1-linux-x64.tar.gz -O node16.tar.gz