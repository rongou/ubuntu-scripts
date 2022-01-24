#!/usr/bin/env bash

set -ex

CUDF_VERSION="22.04"

source "${HOME}/.miniconda3/etc/profile.d/conda.sh"
conda deactivate
git co branch-"${CUDF_VERSION}"
git fetch upstream
git rebase upstream/branch-"${CUDF_VERSION}"
if [[ -n "${DISPLAY}" ]]; then
  git push
fi
conda env create -f conda/environments/cudf_dev_cuda11.5.yml --force
conda activate cudf_dev
