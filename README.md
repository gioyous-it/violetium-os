# VioletiumOS

[![Stars](https://img.shields.io/github/stars/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os)
[![Forks](https://img.shields.io/github/forks/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/network/members)
[![Issues](https://img.shields.io/github/issues/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/issues)
[![Last Commit](https://img.shields.io/github/last-commit/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/commits/main)

VioletiumOS is a lightweight Debian-based Linux distribution designed to make Debian more approachable for newer users. It aims to provide a usable desktop, essential applications, sensible defaults, and an accessible community while retaining the flexibility and software ecosystem of Debian.

## Current Normal Release

Seedling 0.1.5 is the current release.

## Current LTS Release

None.

### Desktop

* Fluxbox
* Xorg
* LightDM
* Weston (planned for Seedling 0.2)

### System

* Debian base
* NetworkManager
* systemd
* Automatic ZRAM
* Lightweight package selection
* PipeWire audio

## Building

VioletiumOS is built using Debian live-build.

You can build it using:

* `build-all.sh`
* `live-build`

Build all configured architectures:

```bash
./build-all.sh
```

Build specific architectures:

```bash
./build-all.sh --archs amd64 arm64
```

Or build the currently configured architecture directly:

```bash
sudo lb build
```

## Status

VioletiumOS is experimental software and is currently in pre-alpha development. Seedling 0.1.x releases are intended for testing and development.

## License

VioletiumOS's original configuration files and scripts are licensed under the GNU General Public License version 3 or later.
