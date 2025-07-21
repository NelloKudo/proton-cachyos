#!/usr/bin/env bash
set -eu

patch_cmd() {
    echo "Applying:: $(basename "$1")"
    patch -Np1 -i "$1"
}

here="$(dirname "$(realpath "$0")")"

pushd "$here"/../openfst || exit 1
    patch_cmd "$here"/openfst/openfst-879f09d2ac799cca99b78de3442194ebbe29d24a.patch
    patch_cmd "$here"/openfst/openfst-18e94e63870ebcf79ebb42b7035cd3cb626ec090.patch
popd || exit 1

pushd "$here"/../glslang || exit 1
    patch_cmd "$here"/glslang/glslang-renderdoc-1.36-gcc15-fix.patch
popd || exit 1

pushd "$here"/../wine || exit 1
    patch_cmd "$here"/spritz/0001-HACK-ws2_32-Block-GI-ZZZ-from-connecting-on-first-re.patch
    patch_cmd "$here"/spritz/0002-HACK-kernelbase-Terminate-Genshin-Impact-if-ExitProc.patch
    patch_cmd "$here"/spritz/0003-HACK-winex11-make-WM-focus-window-with-WINE_USE_TAKE.patch
    patch_cmd "$here"/spritz/0004-cachyos-ntsync.patch
    patch_cmd "$here"/spritz/0005-HACK-winex11-Disable-window-opacity-for-Wuthering-Wa.patch
popd || exit 1

pushd "$here"/../vkd3d-proton || exit 1
popd || exit 1
