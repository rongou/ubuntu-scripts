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

# shellcheck disable=SC2155
export PARALLEL_LEVEL=$(nproc)

cd cpp
rm -fr build/*
./runcmake.sh "${1}"

cd build
ninja

cd ../../java
mvn clean install -DPER_THREAD_DEFAULT_STREAM=ON -DUSE_GDS=ON -DskipTests
cp target/cudf-0.19-SNAPSHOT-cuda11.jar /opt/rapids/cudf-0.19-SNAPSHOT-cuda11-"${1}"-ptds-gds.jar

#cd ../cpp/build
#cmake -GNinja .. -DUSE_NVTX=ON
#ninja
#cd ../../java
#mvn clean package -DPER_THREAD_DEFAULT_STREAM=ON -DUSE_GDS=ON -DskipTests
#cp target/cudf-0.19-SNAPSHOT-cuda11.jar /opt/rapids/cudf-0.19-SNAPSHOT-cuda11-"${1}"-nvtx-ptds-gds.jar
