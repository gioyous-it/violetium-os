# VioletiumOS

Violetium is a lightweight Debian-based Linux distribution designed to run well on old computers while remaining useful on modern hardware. It's also designed to be Slightly faster than many Debian Installation, while being more usable, and with no old Bloatware hidden in Debian.

## Current Normal Release

Seedling 0.1.1 is the current release.

## Current LTS Release

none

### Desktop

- Fluxbox
- Xorg
- LightDM
- Weston (Seedland 0.2)

### System

- Debian base
- NetworkManager
- systemd (Seedling 0.1.2)
- automatic ZRAM (Seedling 0.1.2)
- lightweight package selection

Fluxland is planned for a future Violetium release.

## Building

VioletiumOS is built using Debian live-build.

You can build in any of those ways:

- build-all.sh
- live-buuld
  
```bash
./build-all.sh
```

```bash
sudo lb build
```

## Status

VioletiumOS is experimental software. Seedling 0.1.x is intended for testing and development.

## License

VioletiumOS's original configuration files and scripts are licensed under the GNU General Public License version 3 or later.
