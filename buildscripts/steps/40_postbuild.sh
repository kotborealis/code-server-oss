#!/bin/sh

set -ex
mkdir /code-server-oss && cd /code-server-oss

mv /vscode/.build ./
mv /vscode/extensions ./
mv /vscode/node_modules ./
mv /vscode/out-vscode-reh-web-min ./out
mv /vscode/product.json ./
mv /vscode/package.json ./
