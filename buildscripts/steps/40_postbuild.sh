#!/bin/sh

set -ex

# Remove git files
rm -rf .git

# Download node 16
mkdir ./node/
cd ./node/
wget https://nodejs.org/dist/v16.9.1/node-v16.9.1-linux-x64.tar.gz -O node16.tar.gz
tar -xf ./node16.tar.gz --strip-components=1
