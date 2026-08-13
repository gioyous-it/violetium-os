#!/bin/bash
set -e

ARCHES=(
    amd64
    arm64
    armhf
    i386
    ppc64el
    riscv64
    s390x
)

ROOT="$(cd "$(dirname "$0")" && pwd)"
OUT="$ROOT/releases"

mkdir -p "$OUT"

for ARCH in "${ARCHES[@]}"; do
    echo
    echo "========================================"
    echo " Building VioletiumOS for $ARCH"
    echo "========================================"
    echo

    cd "$ROOT"

    sudo lb clean --purge || true

    rm -rf config

    VIOLETIUM_ARCH="$ARCH" ./auto/config

    echo "--- architecture ---"
    grep '^LB_ARCHITECTURES=' config/bootstrap

    echo "--- installer ---"
    grep -E '^LB_DEBIAN_INSTALLER=' config/binary

    echo "--- initramfs ---"
    grep '^LB_INITRAMFS=' config/common

    echo "--- bootloader ---"
    grep '^LB_BOOTLOADER=' config/binary

    echo
    echo "Building $ARCH..."
    echo

    sudo lb build

    ISO="$(find "$ROOT" -maxdepth 1 -type f -name "VioletiumOS-$ARCH*.iso" -print -quit)"

    if [ -n "$ISO" ]; then
        mv "$ISO" "$OUT/"
    else
        echo "WARNING: no ISO found for $ARCH"
    fi

    echo
    echo "Finished: $ARCH"
    echo
done

echo "========================================"
echo " All builds completed"
echo "========================================"

ls -lh "$OUT"
