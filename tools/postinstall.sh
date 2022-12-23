#! /usr/bin/env bash

set -ex

# Get project root di
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../ && pwd )"

rm -rf $ROOT/data
mkdir $ROOT/data
cd $ROOT/data

mkdir node
pushd node
tar -xf $ROOT/dist/node16.tar.gz --strip-components=1

popd

tar -xf $ROOT/dist/bundle.tar.gz