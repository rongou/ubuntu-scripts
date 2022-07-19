# shellcheck shell=sh

# Expand $PATH to include the directory where the cuda toolkit goes.
cuda_bin_path="/usr/local/cuda/bin"
if [ -n "${PATH##*${cuda_bin_path}}" ] && [ -n "${PATH##*${cuda_bin_path}:*}" ]; then
    export PATH=$PATH:${cuda_bin_path}
fi

#export CUDA_DEVICE_ORDER=PCI_BUS_ID
#export CUDA_VISIBLE_DEVICES=1
