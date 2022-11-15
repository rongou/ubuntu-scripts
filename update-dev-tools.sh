#!/usr/bin/env bash

set -e

# cmake
CMAKE_VERSION=$(cmake --version | grep -Po "(?<=cmake version )(.*)")
echo "cmake installed version: ${CMAKE_VERSION}"
CMAKE_RELEASE=$(wget -qO - https://api.github.com/repos/Kitware/CMake/releases/latest | jq -r '.tag_name|sub("^v"; "")')
echo "cmake latest release: ${CMAKE_RELEASE}"
if [[ "$CMAKE_VERSION" ==  "$CMAKE_RELEASE" ]]; then
  echo "cmake already is the latest release."
else
  echo "Installing new cmake release ${CMAKE_RELEASE}..."
  wget -qO -\
    "https://github.com/Kitware/CMake/releases/download/v${CMAKE_RELEASE}/cmake-${CMAKE_RELEASE}-linux-x86_64.tar.gz"\
    | tar -xzvf - -C /usr/local --strip-components 1
fi

# ccache
CCACHE_VERSION=$(ccache --version | grep -Po "(?<=ccache version )(.*)")
echo "ccache installed version: ${CCACHE_VERSION}"
CCACHE_RELEASE=$(wget -qO - https://api.github.com/repos/ccache/ccache/releases/latest | jq -r '.tag_name|sub("^v"; "")')
echo "ccache latest release: ${CCACHE_RELEASE}"
if [[ "$CCACHE_VERSION" ==  "$CCACHE_RELEASE" ]]; then
  echo "ccache already is the latest release."
else
  echo "Installing new ccache release ${CCACHE_RELEASE}..."
  wget -qO -\
    "https://github.com/ccache/ccache/releases/download/v${CCACHE_RELEASE}/ccache-${CCACHE_RELEASE}-linux-x86_64.tar.xz"\
    | tar -xJvf - -C /usr/local/bin --strip-components 1 ccache-${CCACHE_RELEASE}-linux-x86_64/ccache
fi

# ninja
NINJA_VERSION=$(ninja --version)
echo "ninja installed version: ${NINJA_VERSION}"
NINJA_RELEASE=$(wget -qO - https://api.github.com/repos/ninja-build/ninja/releases/latest | jq -r '.tag_name|sub("^v"; "")')
echo "ninja latest release: ${NINJA_RELEASE}"
if [[ "$NINJA_VERSION" ==  "$NINJA_RELEASE" ]]; then
  echo "ninja already is the latest release."
else
  echo "Installing new ninja release ${NINJA_RELEASE}..."
  wget -qP ~/Downloads "https://github.com/ninja-build/ninja/releases/download/v${NINJA_RELEASE}/ninja-linux.zip"
  pushd ~/Downloads
  unzip ninja-linux.zip
  mv ninja /usr/local/bin
  rm ninja-linux.zip
  popd
fi
