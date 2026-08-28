# VioletiumOS

[![Stars](https://img.shields.io/github/stars/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os)
[![Forks](https://img.shields.io/github/forks/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/network/members)
[![Issues](https://img.shields.io/github/issues/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/issues)
[![Last Commit](https://img.shields.io/github/last-commit/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/commits/main) ![Debian](https://img.shields.io/badge/based_on-Debian-A81D33?style=for-the-badge&logo=debian) [![License](https://img.shields.io/github/license/gioyous-it/violetium-os?style=for-the-badge)](https://github.com/gioyous-it/violetium-os/blob/main/LICENSE) [![Release](https://img.shields.io/github/v/release/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/releases) [![Pre-Release](https://img.shields.io/github/v/release/gioyous-it/violetium-os?include_prereleases&prerelease&label=pre-release&style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/releases)
[![Contributors](https://img.shields.io/github/contributors/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/graphs/contributors)
[![Commit Activity](https://img.shields.io/github/commit-activity/m/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/commits/main)
[![Repo Size](https://img.shields.io/github/repo-size/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os)
[![Code Size](https://img.shields.io/github/languages/code-size/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os)
[![Top Language](https://img.shields.io/github/languages/top/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os)
[![Downloads](https://img.shields.io/github/downloads/gioyous-it/violetium-os/total?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/releases)
[![Open Issues](https://img.shields.io/github/issues-raw/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/issues)
[![Closed Issues](https://img.shields.io/github/issues-closed-raw/gioyous-it/violetium-os?style=for-the-badge&logo=github)](https://github.com/gioyous-it/violetium-os/issues?q=is%3Aissue+is%3Aclosed)

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
