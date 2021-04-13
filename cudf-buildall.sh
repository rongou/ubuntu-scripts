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

PARALLEL_LEVEL="$(nproc)"
export PARALLEL_LEVEL

cd cpp
rm -fr build/*
./runcmake.sh "${1}"

cd build
ninja

cd ../../java
mvn clean install -DPER_THREAD_DEFAULT_STREAM=ON -DUSE_GDS=ON -DskipTests
if [[ -d /opt/rapids ]]; then
  cp target/cudf-0.??-SNAPSHOT-cuda11.jar /opt/rapids/
else
  cp target/cudf-0.??-SNAPSHOT-cuda11.jar "${HOME}"/rapids/
fi
