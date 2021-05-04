#!/usr/bin/env bash

usage()
{
  echo "usage: buildall.sh gpu_arch"
}

if [ "$1" == "" ]; then
  usage
  exit 1
fi

set -ex

PARALLEL_LEVEL=$(( $(nproc) - 4 ))
export PARALLEL_LEVEL

cd cpp
./runcmake.sh "${1}"

cd build
ninja -j ${PARALLEL_LEVEL}

cd ../../java
mvn install -DPER_THREAD_DEFAULT_STREAM=ON -DUSE_GDS=ON -DskipTests
