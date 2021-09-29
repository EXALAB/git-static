#! /usr/bin/env bash

echo ""
echo "This may take some time, please sit back and take a coffee."
echo ""

mkdir -p output
git clone --depth 1 --shallow-submodules git://github.com/git/git
cd git

export NO_OPENSSL=1
export NO_CURL=1
export CFLAGS="${CFLAGS} -static"

make configure
./configure prefix=/root/output
make
make install
make clean
