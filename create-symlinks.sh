#!/usr/bin/env bash

set -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# For cudf:
ln -sf "${DIR}"/cudf-buildall.sh "${HOME}"/src/cudf/buildall.sh
chmod +x "${HOME}"/src/cudf/buildall.sh
ln -sf "${DIR}"/cudf-refresh.sh "${HOME}"/src/cudf/refresh.sh
chmod +x "${HOME}"/src/cudf/refresh.sh
ln -sf "${DIR}"/cudf-runcmake.sh "${HOME}"/src/cudf/cpp/runcmake.sh
chmod +x "${HOME}"/src/cudf/cpp/runcmake.sh

# For rmm:
ln -sf "${DIR}"/rmm-runcmake.sh "${HOME}"/src/rmm/runcmake.sh
chmod +x "${HOME}"/src/rmm/runcmake.sh

# For CUDA setup:
sudo ln -sf "${DIR}"/etc-profile.d-cuda.sh /etc/profile.d/cuda.sh
sudo ln -sf "${DIR}"/etc-ld.so.conf.d-cuda.conf /etc/ld.so.conf.d/cuda.conf

# For .gitconfig:
ln -sf "${DIR}"/gitconfig "${HOME}"/.gitconfig
