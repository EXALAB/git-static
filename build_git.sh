#! /usr/bin/env bash

#How to use:

#Run: ./build_git.sh /diretory/to/work

echo ""
echo "This may take some time, please sit back and take a coffee."
echo ""

cd $1
git clone git://github.com/git/git
cd git

mkdir -p output/arm
mkdir -p output/arm64
mkdir -p output/i386
mkdir -p output/amd64
mkdir -p output/mipsel
mkdir -p output/mips64el

export NO_OPENSSL=1
export NO_CURL=1
export CFLAGS="${CFLAGS} -static"

make configure
./configure prefix=$1/git/output/arm
make CC="/usr/bin/arm-linux-gnueabihf-gcc"
make install
make clean

make configure
./configure prefix=$1/git/output/arm64
make CC="/usr/bin/aarch64-linux-gnu-gcc"
make install
make clean

make configure
./configure prefix=$1/git/output/i386
make CC="/usr/bin/i686-linux-gnu-gcc"
make install
make clean

make configure
./configure prefix=$1/git/output/amd64
make CC="/usr/bin/x86_64-linux-gnu-gcc"
make install
make clean

make configure
./configure prefix=$1/git/output/mipsel
make CC="/usr/bin/mipsel-linux-gnu-gcc"
make install
make clean

make configure
./configure prefix=$1/git/output/mips64el
make CC="/usr/bin/mips64el-linux-gnuabi64-gcc"
make install
make clean