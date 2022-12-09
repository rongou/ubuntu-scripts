#!/usr/bin/env bash

set -e

compute="$(nvidia-smi --query-gpu=compute_cap --format=csv,noheader | sed 's/[.]//' | paste -sd ';')"
echo "Compute capability: ${compute}"

cmake -GNinja -S . -B build\
 -DGOOGLE_TEST=ON\
 -DUSE_DMLC_GTEST=ON\
 -DUSE_CUDA=ON\
 -DBUILD_WITH_CUDA_CUB=ON\
 -DGPU_COMPUTE_VER="${compute}"\
 -DUSE_NCCL=ON\
 -DPLUGIN_FEDERATED=ON