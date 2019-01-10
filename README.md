# git-static

This is a repo that contain static binary built from the official [Git](https://github.com/git/git), without any modification.

Currently only support all Android device architecture, but it should work on all Unix like platform as well as WSL on Windows.

If you want other architecture, you could modified the script and built it yourself.

Current Git version: [2.20.1](https://github.com/git/git/releases/tag/v2.20.1)

Compiling failed when using crossbuild-essentials-* provided in the repo, but success when using chroot environment, all thanks to the Legendary [QEMU](https://www.qemu.org/).

## How to build:

1. First use the bootstrap.sh script to create a chroot environment:

> ./bootstrap.sh armhf armhf

2. Copy the build_git.sh file into the /root directory in chroot environment.

3. Chroot into the chroot environment, and run the following command:

> cd /root && chmod 755 build_git.sh && ./build_git.sh