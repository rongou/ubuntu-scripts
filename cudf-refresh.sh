#!/usr/bin/env bash

usage()
{
  echo "usage: refresh.sh cudf_version"
}

if [ "$1" == "" ]; then
  usage
  exit 1
fi

set -ex

CUDF_VERSION="$1"

source "${HOME}/.miniconda3/etc/profile.d/conda.sh"
conda deactivate
git co branch-"${CUDF_VERSION}"
git fetch upstream
git rebase upstream/branch-"${CUDF_VERSION}"
if [[ -n "${DISPLAY}" ]]; then
  git push
fi
conda env create -f conda/environments/cudf_dev_cuda11.2.yml --force
conda activate cudf_dev
conda remove cmake --force -y
