#!/bin/bash
set -euo pipefail

ALL_ARCHES=(
    amd64
    arm64
    armhf
    i386
    ppc64el
    riscv64
    s390x
)

if [[ "${1:-}" == "--archs" ]]; then
    shift
    if [[ $# -eq 0 ]]; then
        echo "ERROR: --archs requires at least one architecture."
        echo "Usage: $0 [--archs ARCH [ARCH ...]]"
        exit 2
    fi
    ARCHES=("$@")
else
    ARCHES=("${ALL_ARCHES[@]}")
fi

ROOT="$(cd -- "$(dirname -- "$0")" && pwd)"
OUT="$ROOT/releases"

mkdir -p "$OUT"

for ARCH in "${ARCHES[@]}"; do
    case "$ARCH" in
        amd64|arm64|armhf|i386|ppc64el|riscv64|s390x) ;;
        *)
            echo "ERROR: unsupported architecture: $ARCH"
            exit 2
            ;;
    esac

    echo
    echo "========================================"
    echo " Building VioletiumOS for $ARCH"
    echo "========================================"
    echo

    cd "$ROOT"

    echo "--- Cleaning previous live-build state ---"
    sudo lb clean --purge || true

    echo "--- Configuring $ARCH ---"
    VIOLETIUM_ARCH="$ARCH" ./auto/config

    echo "--- Building $ARCH ---"
    sudo lb build

    ISO="$(find "$ROOT" -maxdepth 1 -type f \
        -name "VioletiumOS-$ARCH*.iso" \
        -print -quit)"

    if [[ -z "$ISO" ]]; then
        echo "ERROR: build completed but no ISO was found for $ARCH."
        exit 1
    fi

    DEST="$OUT/$(basename "$ISO")"

    if [[ -e "$DEST" ]]; then
        echo "Replacing existing release: $DEST"
        rm -f -- "$DEST"
    fi

    mv -- "$ISO" "$DEST"

    echo
    echo "Finished: $ARCH"
    echo "ISO: $DEST"
done

echo
echo "========================================"
echo " All requested builds completed"
echo "========================================"
echo

ls -lh "$OUT"
