# shellcheck shell=sh

# Expand $PATH to include the directory where the ccache symlinks are.
ccache_lib_path="/usr/lib/ccache"
if [ -n "${PATH##*${ccache_lib_path}}" ] && [ -n "${PATH##*${ccache_lib_path}:*}" ]; then
    export PATH=${ccache_lib_path}:$PATH
fi
