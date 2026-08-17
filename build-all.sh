#!/bin/bash
set -euo pipefail

ALL_ARCHES=(
    amd64
    arm64
    armhf
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
        amd64|arm64|armhf|ppc64el|riscv64|s390x)
            ;;
        i386)
            echo "ERROR: i386 is not currently supported."
            echo "VioletiumOS is based on Debian Trixie, which no longer provides an official bootable i386 kernel."
            echo "i386 support may return in a future release."
            exit 2
            ;;
        loong64)
            echo "ERROR: LoongArch64 (loong64) is not currently supported."
            echo "LoongArch64 support is coming soon."
            exit 2
            ;;
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

    echo "--- Checking VioletiumOS packages for $ARCH ---"

    PACKAGE_LIST="config/package-lists/violetium.list.chroot"
    MISSING_PACKAGES=()

    while IFS= read -r PACKAGE || [[ -n "$PACKAGE" ]]; do
        PACKAGE="${PACKAGE%%#*}"
        PACKAGE="$(echo "$PACKAGE" | xargs)"

        [[ -z "$PACKAGE" ]] && continue

        if ! apt-cache show "$PACKAGE" >/dev/null 2>&1; then
            MISSING_PACKAGES+=("$PACKAGE")
        fi
    done < "$PACKAGE_LIST"

    if [[ ${#MISSING_PACKAGES[@]} -gt 0 ]]; then
        echo
        echo "========================================"
        echo " VioletiumOS Packages are Missing"
        echo "========================================"
        echo
        printf '  %s\n' "${MISSING_PACKAGES[@]}"
        echo
        read -r -p "VioletiumOS Packages are Missing. Build anyway? [Y/n] " ANSWER
        ANSWER="${ANSWER:-Y}"

        case "$ANSWER" in
            [Yy]|[Yy][Ee][Ss])
                echo "Continuing build..."
                ;;
            *)
                echo "Build cancelled."
                exit 1
                ;;
        esac
    else
        echo "All VioletiumOS packages are available."
    fi

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
