#!/usr/bin/env bash

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 1210\
 --slave /usr/bin/g++ g++ /usr/bin/g++-12 --slave /usr/bin/gcov gcov /usr/bin/gcov-12
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 1130\
 --slave /usr/bin/g++ g++ /usr/bin/g++-11 --slave /usr/bin/gcov gcov /usr/bin/gcov-11

sudo update-alternatives --config gcc

sudo update-alternatives\
  --install /usr/bin/cc cc /usr/bin/gcc 30\
  --slave /usr/bin/c++ c++ /usr/bin/g++\
  --slave /usr/bin/ld ld /usr/bin/x86_64-linux-gnu-ld

sudo update-alternatives\
  --install /usr/bin/cc cc /usr/bin/clang 20\
  --slave /usr/bin/c++ c++ /usr/bin/clang++\
  --slave /usr/bin/ld ld /usr/bin/lld
