# PolLand

My personal Hyprland "rice" — a configuration collection for Hyprland and related Wayland tooling. It's janky, opinionated, and tailored to my workflow. Use at your own risk and feel free to adapt anything here.

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

This is a personal repo — these configs reflect my preferences (keybindings, layout, colors, programs, hardware configuration). Expect things to be opinionated.

## Screenshots
See the `screenshots/` directory for previews of the setup.

## Status
Development will continue, but progress is slow. Some things are broken at the moment — I know about them and they will be fixed... eventually. If you find issues or have improvements, help is welcome.

## Requirements

### Essential dependencies
- **Hyprland** - Window manager
- **Waybar** - Status bar
- **Rofi** - Application launcher
- **Kitty** - Terminal emulator
- **SWWW** - Wallpaper daemon (for animated/static wallpapers)
- **brightnessctl** - Brightness control
- **wpctl** (pipewire-utils) - Audio control
- **playerctl** - Media playback control

### Optional
- **Flameshot** - Screenshots (bound to Alt+F12)
- **Nautilus** - File manager (or replace with your preferred)
- **Bibata-Modern-Ice** - Cursor theme
- **Catppuccin-Mocha-Blue** - GTK theme

Install these using your distro's package manager. Package names may vary.


### Included configs
This repo provides configurations for:
- Hyprland window manager
- Waybar (with custom scripts)
- Rofi launcher (multiple themes included)
- Kitty terminal
- Neovim
- GTK 3.0 & 4.0 themes
- ani-cli (anime streaming setup)

### Script dependencies
Some Waybar scripts may require additional tools:
- `gpu.sh` - GPU monitoring tools (nvidia-smi, etc.)
- `btc-eur.sh`, `eur-huf.sh` - curl for currency APIs
- `weather.sh` - curl and a weather API
- `lyrics.sh` - playerctl and lyrics API
- `news-ticker.sh` - RSS reader or news API

Check individual scripts in `waybar/scripts/` for specific requirements.

## Installation

### Method 1: Automated install (recommended)

1. **Clone the repository:**
```bash
   git clone https://github.com/Pol-Jak-295/PolLand.git ~/PolLand
   cd ~/PolLand
```

2. **Run the install script:**
```bash
   chmod +x install.sh
   ./install.sh
```

   The script will:
   - Ask if you want to back up existing configs
   - Offer to symlink (recommended) or copy configs
   - Symlinks keep your configs synced with the repo via `git pull`

3. **Reload Hyprland:**
   - Press `Super + Shift + R` or restart your session

### Method 2: Manual install

1. **Clone and inspect:**
```bash
   git clone https://github.com/Pol-Jak-295/PolLand.git ~/PolLand
```

2. **Back up existing configs:**
```bash
   mkdir -p ~/.config/backups
   mv ~/.config/hypr ~/.config/backups/hypr.backup
   mv ~/.config/waybar ~/.config/backups/waybar.backup
   # etc...
```

3. **Symlink what you want:**
```bash
   ln -s ~/PolLand/hypr ~/.config/hypr
   ln -s ~/PolLand/waybar ~/.config/waybar
   ln -s ~/PolLand/rofi ~/.config/rofi
   ln -s ~/PolLand/kitty ~/.config/kitty
   # Continue for other components...
```

4. **Review and customize:**
   - Check `hypr/hyprland.conf` for keybindings and monitor settings
   - Adjust paths in `waybar/config.jsonc` and scripts
   - Test individual components before full restart

### Notes
- **Do not blindly overwrite your current configs** - always back up first - my installer does help with that
- Review configs for hardcoded paths or program names that may differ on your system
- Some scripts assume specific binaries; adapt them as needed

## What's included
```
.
├── ani-cli/          # Anime streaming scripts with rofi integration
├── gtk-3.0/          # GTK3 theme settings
├── gtk-4.0/          # GTK4 theme settings
├── hypr/             # Hyprland configuration
├── kitty/            # Kitty terminal config
├── nvim/             # Neovim configuration
├── rofi/             # Rofi launcher with multiple themes
│   ├── colors/       # 16 color schemes
│   ├── launchers/    # Launcher styles
│   └── images/       # Theme backgrounds
├── waybar/           # Status bar
│   ├── scripts/      # Custom modules (weather, crypto, GPU, etc.)
│   ├── config.jsonc  # Bar layout and modules
│   └── style.css     # Bar styling
├── images/           # Wallpaper and other images the rice uses ()
└── screenshots/     rofi launcher images # Preview images
```

## Usage & customization

### Keybindings

**Main modifier:** `Super` (Windows key)

#### Window Management
| Keybind | Action |
|---------|--------|
| `Super + Q` | Open terminal (Kitty) |
| `Super + C` | Kill active window |
| `Super + F` | Toggle fullscreen |
| `Super + V` / `Super + Space` | Toggle floating mode |
| `Super + J` | Toggle split (dwindle layout) |
| `Super + P` | Pseudotile |
| `Alt + F4` / `Alt + XF86LaunchB` | Kill active window |
| `Super + ←/→/↑/↓` | Move focus between windows |
| `Super + Mouse Left` (drag) | Move window |
| `Super + Mouse Right` (drag) | Resize window |

#### Workspaces
| Keybind | Action |
|---------|--------|
| `Super + [1-9,0]` | Switch to workspace 1-10 |
| `Super + Shift + [1-9,0]` | Move window to workspace 1-10 |
| `Super + Tab` | Next workspace |
| `Super + Shift + Tab` | Previous workspace |
| `Super + Mouse Scroll` | Cycle workspaces |
| `Super + S` | Toggle scratchpad |
| `Super + Shift + S` | Move window to scratchpad |
| `Alt + Tab` | Cycle to next window |

Workspaces are named with Japanese numerals (一, 二, 三, etc.)

#### Applications
| Keybind | Action |
|---------|--------|
| `Super + R` | Rofi launcher |
| `Super + E` | File manager (Nautilus) |
| `Super + A` | Ani-cli (anime streaming menu) |
| `Super + M` | Power menu (if installed) |
| `Alt + F12` | Screenshot (Flameshot) |

#### Media Controls
| Keybind | Action |
|---------|--------|
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
- **3-finger horizontal swipe** - Switch workspaces

### Customizing
- **Colors/theme:** Look in `waybar/style.css`, `rofi/colors/`, and GTK configs
- **Monitor layout:** Edit monitor settings in `hypr/hyprland.conf`
- **Waybar modules:** Enable/disable in `waybar/config.jsonc`
- **Rofi theme:** Change theme path in `rofi/config.rasi`

### Updating (if symlinked)
```bash
cd ~/PolLand
git pull
```
Changes take effect immediately or after reloading Hyprland.

## Features

### Theming
- **Color scheme:** Catppuccin Mocha with custom blue/lavender accents
- **Cursor:** Bibata-Modern-Ice
- **Borders:** Gradient animated borders (sapphire → lavender)
- **Rounded corners:** 10px with power curve
- **Gaps:** 5px inner, 10px outer

### Animations
Smooth bezier-curve animations for:
- Window open/close with popin effect
- Workspace switching with fade
- Border color transitions
- Layer (overlay) animations

### Workspace Names
Japanese numeral workspace names (一, 二, 三, 四, 五, 六, 七, 八, 九, 十)

### Auto-start
- Waybar status bar
- SWWW wallpaper daemon (loads Hatsune Miku wallpaper by default)
- Proper cursor and GTK theme initialization

## Contributing & help
This is primarily my personal configuration, but contributions are welcome:
- Bug fixes and portability improvements are appreciated
- Include a description of what you changed and why
- Prefer small, focused PRs
- For issues, include reproduction steps and relevant logs/screenshots

## Known issues
- Some components are incomplete or experimental
- Install procedures are intentionally manual to encourage inspection
- Waybar scripts may need dependency adjustments for your system
- File an issue with details if something breaks for you

## License
This repository is distributed under the MIT License. See the LICENSE file for full text.

Short summary: you may use, copy, modify, and distribute this code with attribution. No warranty is provided.

## Credits & contact
- Created by [Pol-Jak-295](https://github.com/Pol-Jak-295)
- Built on the excellent work of the Wayland/Hyprland community
- Individual tools: Hyprland, Waybar, Rofi, and their respective maintainers
- If I've used your work and you'd like attribution or removal, please contact me

---

**Note:** Parts of this documentation were written with AI assistance.