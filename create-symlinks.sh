#!/usr/bin/env bash

set -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ln -sf "${DIR}"/cudf-buildall.sh "${HOME}"/src/cudf/buildall.sh
chmod +x "${HOME}"/src/cudf/buildall.sh
ln -sf "${DIR}"/cudf-refresh.sh "${HOME}"/src/cudf/refresh.sh
chmod +x "${HOME}"/src/cudf/refresh.sh
ln -sf "${DIR}"/cudf-runcmake.sh "${HOME}"/src/cudf/cpp/runcmake.sh
chmod +x "${HOME}"/src/cudf/cpp/runcmake.sh
