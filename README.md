# Violetium

Violetium is a lightweight Debian-based Linux distribution designed to run well on old computers while remaining useful on modern hardware. It's also designed to be Slightly faster than many Debian Installation, while being more usable, and with no old Bloatware hidden in Debian.

## Seedling 0.1

Seedling 0.1.1 is the current release.

### Desktop

- Fluxbox
- Xorg
- LightDM

Soon adding Fluxland, Not Implementing yet Because 0.1.1 is still focused on testing, updates and refinement.

### System

- Debian base
- NetworkManager
- systemd
- automatic ZRAM
- lightweight package selection

Fluxland is planned for a future Violetium release.

## Building

Violetium is built using Debian live-build.

```bash
sudo lb build
```

## Status

Violetium is experimental software. Seedling 0.1.x is intended for testing and development.

## License

Violetium's original configuration files and scripts are licensed under the GNU General Public License version 3 or later.
