#!/usr/bin/env bash

set -ex

source "${HOME}/.miniconda3/etc/profile.d/conda.sh"
conda deactivate
git co branch-0.20
git fetch upstream
git rebase upstream/branch-0.20
git push
conda env create -f conda/environments/cudf_dev_cuda11.0.yml --force
conda activate cudf_dev
conda remove cmake --force -y
