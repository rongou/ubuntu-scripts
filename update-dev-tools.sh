#!/usr/bin/env bash

set -e

micromamba self-update

# Retrieve GitHub authentication token and store it in a variable
TOKEN=$(gh auth token)

# Check if the token was successfully retrieved
if [ -z "$TOKEN" ]; then
    echo "Failed to retrieve GitHub token. Make sure you are logged in using 'gh auth login'."
    exit 1
fi

function compare_versions() {
  if [[ $(printf '%s\n' "$1" "$2" | sort -V | head -n1) = "$1" ]]; then
    return 0  # "$1" is less than or equal to "$2"
  else
    return 1  # "$1" is greater than "$2"
  fi
}

# cmake
CMAKE_VERSION=$(cmake --version | grep -Po "(?<=cmake version )(.*)" || echo "0.0.0")
echo "cmake installed version: ${CMAKE_VERSION}"
CMAKE_RELEASE=$(wget -qO - https://api.github.com/repos/Kitware/CMake/releases/latest | jq -r '.tag_name|sub("^v"; "")')
echo "cmake latest release: ${CMAKE_RELEASE}"
if compare_versions "$CMAKE_RELEASE" "$CMAKE_VERSION"; then
  echo "cmake already is the latest release."
else
  echo "Installing new cmake release ${CMAKE_RELEASE}..."
  wget -qO -\
    "https://github.com/Kitware/CMake/releases/download/v${CMAKE_RELEASE}/cmake-${CMAKE_RELEASE}-linux-x86_64.tar.gz"\
    | tar -xzvf - -C /usr/local --strip-components 1
fi

# ccache
CCACHE_VERSION=$(ccache --version | grep -Po "(?<=ccache version )(.*)" || echo "0.0.0")
echo "ccache installed version: ${CCACHE_VERSION}"
CCACHE_RELEASE=$(wget -qO - https://api.github.com/repos/ccache/ccache/releases/latest | jq -r '.tag_name|sub("^v"; "")')
echo "ccache latest release: ${CCACHE_RELEASE}"
if compare_versions "$CCACHE_RELEASE" "$CCACHE_VERSION"; then
  echo "ccache already is the latest release."
else
  echo "Installing new ccache release ${CCACHE_RELEASE}..."
  wget -qO -\
    "https://github.com/ccache/ccache/releases/download/v${CCACHE_RELEASE}/ccache-${CCACHE_RELEASE}-linux-x86_64.tar.xz"\
    | tar -xJvf - -C /usr/local/bin --strip-components 1 ccache-${CCACHE_RELEASE}-linux-x86_64/ccache
fi

# ninja
NINJA_VERSION=$(ninja --version || echo "0.0.0")
echo "ninja installed version: ${NINJA_VERSION}"
NINJA_RELEASE=$(wget -qO - https://api.github.com/repos/ninja-build/ninja/releases/latest | jq -r '.tag_name|sub("^v"; "")')
echo "ninja latest release: ${NINJA_RELEASE}"
if compare_versions "$NINJA_RELEASE" "$NINJA_VERSION"; then
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

# neovim
NEOVIM_VERSION=$(nvim --version | grep -Po "(?<=NVIM v)(.*)" || echo "0.0.0")
echo "neovim installed version: ${NEOVIM_VERSION}"
NEOVIM_RELEASE=$(wget -qO - https://api.github.com/repos/neovim/neovim/releases/latest | jq -r '.tag_name|sub("^v"; "")')
echo "neovim latest release: ${NEOVIM_RELEASE}"
if compare_versions "$NEOVIM_RELEASE" "$NEOVIM_VERSION"; then
  echo "neovim already is the latest release."
else
  echo "Installing new neovim release ${NEOVIM_RELEASE}..."
  wget -qO -\
    "https://github.com/neovim/neovim/releases/download/v${NEOVIM_RELEASE}/nvim-linux-x86_64.tar.gz"\
    | tar -xzvf - -C /usr/local --strip-components 1
fi
