#!/usr/bin/env bash

sudo update-alternatives\
 --install /usr/bin/gcc gcc /usr/local/gcc-12.1.0/bin/gcc 121\
 --slave /usr/bin/g++ g++ /usr/local/gcc-12.1.0/bin/g++\
 --slave /usr/bin/gcov gcov /usr/local/gcc-12.1.0/bin/gcov
sudo update-alternatives\
 --install /usr/bin/gcc gcc /usr/local/gcc-11.3.0/bin/gcc-11.3 113\
 --slave /usr/bin/g++ g++ /usr/local/gcc-11.3.0/bin/g++-11.3\
 --slave /usr/bin/gcov gcov /usr/local/gcc-11.3.0/bin/gcov-11.3
sudo update-alternatives\
 --install /usr/bin/gcc gcc /usr/local/gcc-11.2.0/bin/gcc-11.2 112\
 --slave /usr/bin/g++ g++ /usr/local/gcc-11.2.0/bin/g++-11.2\
 --slave /usr/bin/gcov gcov /usr/local/gcc-11.2.0/bin/gcov-11.2
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 1120\
 --slave /usr/bin/g++ g++ /usr/bin/g++-11 --slave /usr/bin/gcov gcov /usr/bin/gcov-11
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100\
 --slave /usr/bin/g++ g++ /usr/bin/g++-10 --slave /usr/bin/gcov gcov /usr/bin/gcov-10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90\
 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80\
 --slave /usr/bin/g++ g++ /usr/bin/g++-8 --slave /usr/bin/gcov gcov /usr/bin/gcov-8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70\
 --slave /usr/bin/g++ g++ /usr/bin/g++-7 --slave /usr/bin/gcov gcov /usr/bin/gcov-7

sudo update-alternatives --config gcc

sudo update-alternatives\
  --install /usr/bin/cc cc /usr/bin/gcc 30\
  --slave /usr/bin/c++ c++ /usr/bin/g++\
  --slave /usr/bin/ld ld /usr/bin/x86_64-linux-gnu-ld

sudo update-alternatives\
  --install /usr/bin/cc cc /usr/bin/clang 20\
  --slave /usr/bin/c++ c++ /usr/bin/clang++\
  --slave /usr/bin/ld ld /usr/bin/lld
