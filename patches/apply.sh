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

pushd "$here"/../wine || exit 1
    patch_cmd "$here"/spritz/0001-HACK-ws2_32-Block-first-internet-connection-for-some.patch
    patch_cmd "$here"/spritz/0002-HACK-kernelbase-Terminate-Genshin-Impact-if-ExitProc.patch
    patch_cmd "$here"/spritz/0003-HACK-winex11-make-WM-focus-window-with-WINE_USE_TAKE.patch
    patch_cmd "$here"/spritz/0004-HACK-winex11-Disable-window-opacity-for-Wuthering-Wa.patch
    patch_cmd "$here"/spritz/0005-ntdll-set-WINE_ENABLE_STEAM_STUB-for-GI.patch
    patch_cmd "$here"/spritz/0006-backports-ntdll-Also-trap-syscalls-in-the-top-down-reserved-ar.patch
popd || exit 1
