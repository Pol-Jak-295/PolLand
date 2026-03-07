# PolLand

My personal Hyprland rice — a configuration collection for Hyprland and related Wayland tooling. It's janky, opinionated, and tailored to my workflow. Use at your own risk and feel free to adapt anything here.

## Table of contents
- [About](#about)
- [Screenshots](#screenshots)
- [Status](#status)
- [Requirements](#requirements)
- [Installation](#installation)
- [What's included](#whats-included)
- [Usage & customization](#usage--customization)
- [Contributing & help](#contributing--help)
- [Known issues](#known-issues)
- [License](#license)
- [Credits & contact](#credits--contact)

## About

This repository contains my Hyprland configuration, themes, scripts, and small customizations. It's intended as a working personal setup and as a reference for others who want ideas or pieces to reuse.

This is a personal repo — these configs reflect my preferences (keybindings, layout, colors, programs, hardware). Expect things to be opinionated.

## Screenshots

![Daily usage](screenshots/screenshot-daily-usage.png)
![Music](screenshots/screenshot-music.png)
![Workflow](screenshots/screenshot-workflow-2.png)
![App launcher](screenshots/screenshot-launcher.png)
![Ani-cli rofi](screenshots/screenshot-ani-cli_rofi.png)

## Status

Active development — recent updates include:
- ✅ **Lock screen** — Hyprlock with Frieren aesthetic
- ✅ **Login manager** — Custom SDDM Sugar Candy theme with Frieren wallpaper
- ✅ **Power menu** — nwg-bar with lock, logout, suspend, reboot, shutdown, and kexec quick-update
- ✅ **Terminal** — Kitty as login shell, Catppuccin Mocha colors, top tab bar
- ✅ **Neovim** — lazy.nvim with Catppuccin, Telescope, Treesitter, nvim-tree, lualine, bufferline
- ✅ **Cleanup** — Removed unused Rofi themes and obsolete scripts
- ✅ **Workspace names** — Japanese numeral workspaces (一, 二, 三, 四, 五, 六, 七, 八, 九, 十)
- ✅ **Music** — Spicetify with Catppuccin Mocha, waybar-lyric integration, Spotify album art notifications
- ✅ **Notifications** — SwayNC with Japanese UI text (通知, 消去, 無音), MPRIS widget, Catppuccin Mocha styling
- ✅ **Darkman** — Light/dark mode switching integration

Some things may still be janky, but they're *my* kind of janky. PRs and ideas welcome.

## Requirements

### Disclaimer

This configuration is developed and tested on Arch Linux. Package names and install methods may differ on other distributions, and some dependencies might be AUR-only.

due to recent changes the wallapeper in the screenshot is not accurate, and the current wallpaper is subject to change in the near future.

### Essential dependencies

- **Hyprland** — Window manager
- **Waybar** — Status bar (with waybar-lyric for lyrics module)
- **Rofi** — Application launcher
- **Kitty** — Terminal emulator
- **SWWW** — Wallpaper daemon
- **brightnessctl** — Brightness control
- **wpctl** (pipewire-utils) — Audio control
- **playerctl** — Media playback control
- **hyprlock** — Lock screen
- **nwg-bar** — Power menu
- **sddm** + Sugar Candy theme — Login manager
- **swaync** — Notification center
- **kexec-tools** — Quick reboot without POST (used in power menu)
- **darkman** — Automatic light/dark mode switching

### Optional

- **Flameshot** — Screenshots (bound to `Alt+F12`)
- **Nautilus** — File manager
- **Bibata-Modern-Ice** — Cursor theme
- **Catppuccin-Mocha-Blue** — GTK theme
- **Spicetify** — Spotify theming (Catppuccin Mocha)
- **spotify-adblock** — Ad blocking for Spotify
- **ani-cli** — Anime streaming (installed to `/usr/bin/ani-cli` by root installer)

### Script dependencies

Some Waybar scripts require additional tools:
- `gpu.sh` — Reads from `/sys/class/drm/card1/device/gpu_busy_percent` (AMD GPU)
- `lyrics.sh` — Requires `waybar-lyric` and `playerctl`

Check individual scripts in `waybar/scripts/` for details.

## Installation

### Method 1: Automated install (recommended)

1. Clone the repository:
```bash
git clone https://github.com/Pol-Jak-295/PolLand.git ~/PolLand
cd ~/PolLand
```

2. Run the install script:
```bash
chmod +x install.sh
./install.sh
```

The script will:
- Ask if you want to back up existing configs
- Offer to symlink (recommended) or copy configs
- Symlinks keep your configs in sync with the repo via `git pull`
- Optionally run `root-required-installer.sh` for SDDM, ani-cli, and nwg-bar icon setup

3. Reload Hyprland with `Super+Shift+R` or restart your session.

### Method 2: HailMary (curl | sh)

Run the danger (does not check for dependencies):
```bash
curl -fsSL https://raw.githubusercontent.com/Pol-Jak-295/PolLand/main/instantinstall.sh | sh
```

### Method 3: Manual install

1. Clone and inspect:
```bash
git clone https://github.com/Pol-Jak-295/PolLand.git ~/PolLand
```

2. Back up existing configs:
```bash
mkdir -p ~/.config/backups
mv ~/.config/hypr ~/.config/backups/hypr.backup
mv ~/.config/waybar ~/.config/backups/waybar.backup
# etc.
```

3. Symlink what you want:
```bash
ln -s ~/PolLand/hypr ~/.config/hypr
ln -s ~/PolLand/waybar ~/.config/waybar
ln -s ~/PolLand/rofi ~/.config/rofi
ln -s ~/PolLand/kitty ~/.config/kitty
# Continue for other components
```

4. Review and customize:
   - Check `hypr/hyprland.conf` for keybindings and monitor settings
   - Adjust paths in `waybar/config.jsonc` and scripts
   - Test individual components before a full restart

> **Do not blindly overwrite your current configs** — always back up first. The installer helps with this.

### Notes
- Review configs for hardcoded paths or program names that may differ on your system
- Some scripts assume specific binaries; adapt them as needed
- The root installer copies the SDDM theme, ani-cli binary, and nwg-bar icons — run it separately if you skip it during the main install

## What's included

```
.
├── ani-cli/              # Anime streaming scripts with Rofi integration
│   ├── ani-cli           # The ani-cli script itself
│   ├── ani-cli-rofi.sh   # Rofi wrapper
│   ├── rofi-menu.sh      # Search/settings menu
│   └── settings.conf     # DUB, QUALITY, MODE settings
├── etc/                  # System configs
│   └── sddm.conf         # SDDM login manager config
├── fastfetch/            # Fastfetch config with Miku ASCII art
│   ├── config.jsonc
│   └── miku.ansi
├── gtk-3.0/              # GTK3 theme settings
├── gtk-4.0/              # GTK4 theme settings
├── hypr/                 # Hyprland and Hyprlock configuration
│   ├── hyprland.conf
│   ├── hyprlock.conf
│   └── scripts/
│       └── spotify-notify.sh
├── images/               # Wallpapers used by the rice
├── kitty/                # Kitty terminal config
├── nvim/                 # Neovim configuration
│   ├── init.lua
│   └── lazy-lock.json
├── nwg-bar/              # Power menu config
│   ├── bar.json
│   ├── style.css
│   ├── icons/
│   │   └── kexec.svg
│   └── scripts/
│       ├── kexec.sh
│       └── suspender.sh
├── rofi/                 # Rofi launcher themes
│   ├── config.rasi
│   └── launchers/type-6/
│       ├── style-3.rasi  # Rimuru theme (ani-cli)
│       └── style-4.rasi  # Miku theme (app launcher)
├── screenshots/          # Preview images
├── sugar-candy/          # SDDM Sugar Candy login theme
├── swaync/               # Notification center
│   ├── config.json
│   └── style.css
├── waybar/               # Status bar config, styles, and scripts
│   ├── config.jsonc
│   ├── style.css
│   └── scripts/
│       ├── gpu.sh
│       └── lyrics.sh
├── install.sh
├── root-required-installer.sh
├── instantinstall.sh
├── suspender.sh
├── .zshrc
└── .zprofile
```

## Usage & customization

### Keybindings

**Main modifier:** `Super` (Windows key)

#### Window management
| Keybind | Action |
|---|---|
| `Super+Q` | Open terminal (Kitty) |
| `Super+C` | Kill active window |
| `Super+F` | Toggle fullscreen |
| `Super+V` / `Super+Space` | Toggle floating mode |
| `Super+J` | Toggle split (dwindle layout) |
| `Super+P` | Pseudotile |
| `Alt+F4` / `Alt+XF86LaunchB` | Kill active window |
| `Super+←/→/↑/↓` | Move focus between windows |
| `Super+Mouse Left` (drag) | Move window |
| `Super+Mouse Right` (drag) | Resize window |

#### Workspaces
| Keybind | Action |
|---|---|
| `Super+[1–9, 0]` | Switch to workspace 1–10 |
| `Super+Shift+[1–9, 0]` | Move window to workspace 1–10 |
| `Super+Tab` | Next workspace |
| `Super+Shift+Tab` | Previous workspace |
| `Super+Mouse Scroll` | Cycle workspaces |
| `Super+S` | Toggle scratchpad |
| `Super+Shift+S` | Move window to scratchpad |
| `Alt+Tab` | Cycle to next window |

Workspaces are named with Japanese numerals (一, 二, 三, 四, 五, 六, 七, 八, 九, 十).

#### Applications
| Keybind | Action |
|---|---|
| `Super+R` | Rofi app launcher (Miku theme) |
| `Super+E` | File manager (Nautilus) |
| `Super+A` | Ani-cli Rofi menu (Rimuru theme) |
| `Super+M` | Power menu (nwg-bar) |
| `Super+N` | Toggle SwayNC notification center |
| `Alt+F12` | Screenshot (Flameshot) |

#### Media controls
| Keybind | Action |
|---|---|
| `XF86AudioRaiseVolume` | Volume +5% |
| `XF86AudioLowerVolume` | Volume -5% |
| `XF86AudioMute` | Toggle mute |
| `XF86AudioMicMute` | Toggle microphone mute |
| `XF86MonBrightnessUp` | Brightness +5% |
| `XF86MonBrightnessDown` | Brightness -5% |
| `XF86AudioPlay/Pause` | Play/pause media |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |

#### Gestures
- **3-finger horizontal swipe** — Switch workspaces

### Theming

- **Color scheme** — Catppuccin Mocha with sapphire (`#74c7ec`) / teal (`#94e2d5`) accents
- **Cursor** — Bibata-Modern-Ice (24px)
- **GTK theme** — Catppuccin-Mocha-Blue
- **Borders** — Gradient animated borders (sapphire → lavender), 3px, 10px rounding
- **Gaps** — 5px inner, 10px outer

### Darkman

Darkman handles automatic light/dark mode switching based on time of day. The integration hooks into GTK theming so apps that respect the light/dark portal switch correctly. Configuration lives outside the main rice directory — check `darkman`'s own docs for location setup.

### Customizing

- **Colors/theme** — `waybar/style.css`, `swaync/style.css`, `nwg-bar/style.css`, `rofi/launchers/type-6/`
- **Monitor layout** — `hypr/hyprland.conf` (monitor section at the top)
- **Waybar modules** — `waybar/config.jsonc`
- **Rofi launcher image** — Replace `~/.config/images/MIKU.jpg` (style-4) or `~/.config/images/Rimuru.jpg` (style-3)
- **Lock screen** — `hypr/hyprlock.conf`, replace `~/.config/images/frieren.png`
- **Input sensitivity** — `hypr/hyprland.conf` input section (currently `-1.5` mouse, `0.4` touchpad)

### Updating (if symlinked)

```bash
cd ~/PolLand
git pull
```

Changes take effect immediately or after reloading Hyprland (`Super+Shift+R`).

## Features

### Waybar modules

Left: app launcher button, CPU %, RAM %, network status, system tray, live lyrics
Center: workspace switcher with Japanese numerals
Right: brightness, volume, clock, battery, power menu button

### Fastfetch

Hatsune Miku ANSI art with Catppuccin-colored system info. Runs at shell start via `.zprofile`.

### Power menu (nwg-bar)

- Lock (`hyprlock`)
- Logout (`hyprctl dispatch exit`)
- Suspend (`hyprlock` + `systemctl suspend`)
- Reboot (`systemctl reboot`)
- Shutdown (`systemctl -i poweroff`)
- Quick Update — `kexec` reload (boots into new kernel without POST; useful after `pacman -Syu`)

### Notifications (SwayNC)

Japanese UI labels, Catppuccin Mocha styling, MPRIS media widget at the top. Album art notifications for Spotify via `hypr/scripts/spotify-notify.sh`.

### Shell (Zsh)

Powerlevel10k prompt, oh-my-zsh, git-aware prompt, Kitty-aware truecolor syntax highlighting, extensive aliases. Notable ones: `stfu` (`pacman -Syuq`), `fuck` (`reboot`), `:wq` (`exit`).

## Contributing & help

This is primarily a personal configuration, but contributions are welcome:
- Bug fixes and portability improvements are appreciated
- Include a description of what you changed and why
- Prefer small, focused PRs
- For issues, include reproduction steps and relevant logs or screenshots

## Known issues

- Some components are incomplete or experimental
- Waybar GPU script assumes AMD dGPU at `card1` — adjust path for your hardware
- `waybar/config.jsonc` has a hardcoded absolute path for the rofi launcher (`/home/jaka/...`) — fix this for your username
- Install procedures are intentionally manual to encourage inspection

## License

Distributed under the MIT License. See the `LICENSE` file for full text.

You may use, copy, modify, and distribute this code with attribution. No warranty is provided.

## Credits & contact

- Created by [Pol-Jak-295](https://github.com/Pol-Jak-295)
- Built on the work of the Wayland/Hyprland community
- Rofi themes based on work by [adi1090x](https://github.com/adi1090x), modified for PolLand
- ani-cli by [pystardust](https://github.com/pystardust/ani-cli) — bundled for convenience, subject to its own GPL-3.0 license
- Individual tools: Hyprland, Waybar, Rofi, Kitty, SwayNC, nwg-bar, and their respective maintainers
- If I've used your work and you'd like attribution or removal, please open an issue

---

*Parts of this documentation were written with AI assistance.*
