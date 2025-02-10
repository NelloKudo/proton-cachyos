#!/usr/bin/env bash
set -eu

patch_cmd() {
    echo "Applying:: $(basename "$1")"
    patch -Np1 -i "$1"
}

here="$(dirname "$(realpath "$0")")"

pushd "$here"/../glslang || exit 1
    patch_cmd "$here"/glslang/glslang-renderdoc-1.36-gcc15-fix.patch
popd || exit 1

