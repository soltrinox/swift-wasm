#!/bin/bash

set -ex

if [ -x "$(command -v pip)" ]; then
  pip install six
fi
pip3 install six

brew install cmake ninja llvm sccache

# Install latest wasmer
if [ ! -e ~/.wasmer/bin/wasmer ]; then
  curl https://get.wasmer.io -sSfL | sh -s "2.1.1"
fi

SOURCE_PATH="$(cd "$(dirname $0)/../../../../" && pwd)"
SWIFT_PATH=$SOURCE_PATH/swift
cd $SWIFT_PATH

./utils/update-checkout --clone --scheme wasm/5.6 --skip-repository swift

cd $SOURCE_PATH

