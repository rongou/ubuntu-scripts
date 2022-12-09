#!/usr/bin/env bash

set -e

cmake -GNinja -S . -B build\
 -DgRPC_INSTALL=ON\
 -DgRPC_BUILD_TESTS=OFF\
 -DABSL_PROPAGATE_CXX_STD=ON\
 -DCMAKE_INSTALL_PREFIX="${CONDA_PREFIX}"
