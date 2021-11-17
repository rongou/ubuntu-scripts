#!/usr/bin/env bash

usage()
{
  echo "usage: runcmake.sh gpu_arch"
}

if [ "$1" == "" ]; then
  usage
  exit 1
fi

set -ex

cmake -GNinja -S . -B build\
 -DCMAKE_INSTALL_PREFIX="$CONDA_PREFIX"\
 -DCMAKE_CUDA_ARCHITECTURES="${1}"\
 -DDISABLE_DEPRECATION_WARNING=ON\
 -DBUILD_TESTS=OFF\
 -DBUILD_BENCHMARKS=OFF\
 -DCUDF_USE_ARROW_STATIC=ON\
 -DUSE_NVTX=ON\
 -DPER_THREAD_DEFAULT_STREAM=ON\
 -DCUDA_ENABLE_LINEINFO=ON
