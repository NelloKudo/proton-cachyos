#!/usr/bin/env bash
set -eu

patch_cmd() {
    echo "Applying:: $(basename "$1")"
    patch -Np1 -i "$1"
}

here="$(dirname "$(realpath "$0")")"

pushd "$here"/../wine || exit 1
    patch_cmd "$here"/spritz/0003-ntsync-cachyos-10.patch
popd || exit 1

pushd "$here"/.. || exit 1
    patch_cmd "$here"/spritz/proton/0001-proton-enable-ntsync.patch
popd || exit 1