# hyprland-dotfiles

My personal Hyprland "rice" — a configuration collection for Hyprland and related Wayland tooling. It's janky, opinionated, and tailored to my workflow. Use at your own risk and feel free to adapt anything here.

## Table of contents
- [About](#about)
- [Status](#status)
- [Requirements](#requirements)
- [Quick install (example)](#quick-install-example)
- [Usage & customization](#usage--customization)
- [Contributing & help](#contributing--help)
- [Known issues](#known-issues)
- [License](#license)
- [Credits & contact](#credits--contact)
- [AI disclaimer](#ai-disclaimer)

## About
This repository contains my Hyprland configuration, themes, scripts, and small customizations. It's intended as a working personal setup and as a reference for others who want ideas or pieces to reuse.

This is a personal repo — these configs reflect my preferences (keybindings, layout, colors, programs, hardware configuration). Expect things to be opinionated.

## Status
Development will continue, but progress is slow. Some things are broken at the moment — I know about them and they will be fixed... once. If you find issues or have improvements, help is welcome.

## Requirements
At a minimum you will need:
- A Wayland session and Hyprland installed
- Your choice of greeter
- The following programs for which the config files are: Kitty (terminal emulator), Nautilus (it is mentioned in the hyprland config, but not necessary if you preffer another), Waybar, Rofi (launcher)
- Familiarity with configuring and restoring your dotfiles

Exact dependencies vary by file. Inspect each configuration before applying it.

## Quick install (example)
Always back up your existing configuration before applying anything.

1. Backup:
   - mv ~/.config/hyprland ~/.config/hyprland.backup
2. Clone repository (example location):
   - git clone https://github.com/Pol-Jak-295/hyprland-dotfiles.git ~/dotfiles/hyprland
3. Inspect configs:
   - Review files in the cloned repo and adjust variables (paths, program names, theme values) to match your system.
4. Copy or symlink the pieces you want:
   - mkdir -p ~/.config
   - ln -s ~/dotfiles/hyprland/hyprland ~/.config/hyprland
   - Repeat for other components (bars, menus, scripts).
5. Restart or re-login to your Hyprland session.

Notes:
- Do not blindly overwrite your current configs.
- Some scripts assume specific binaries or helper scripts; adapt them as needed.

## Usage & customization
- Read through config files to understand keybindings, workspace rules, and program hooks.
- Replace programs (e.g., terminal, launcher) with your preferred choices.
- Colors, fonts, and layout values are easy to tweak — search for obvious variables at the top of files.
- If you add or modify something, a short description in the commit/PR helps me and other users understand the intent.

## Contributing & help
This is primarily my personal configuration, but contributions are welcome:
- If you send changes, include a description of what you changed and why.
- Prefer small, focused PRs for fixes or portability improvements.
- If you open an issue, include steps to reproduce and any relevant logs or screenshots.
- I'm happy to accept fixes that make configs more portable or clearer.

Help welcome — whether it's bug fixes, portability tweaks, or polishing documentation.

## Known issues
- Some components are incomplete or broken right now. I am aware and will fix them over time.
- Install procedures are intentionally manual to encourage inspection; automation may appear later once things stabilize.
- If something is broken for you, file an issue with details.

## License
This repository is distributed under the MIT License. See the LICENSE file for full text.

Short summary: you may use, copy, modify, and distribute this code with attribution. No warranty is provided.

## Credits & contact
- Owner / contact: [Pol-Jak-295](https://github.com/Pol-Jak-295)
- This repo contains my personal configurations and small scripts — I reuse public projects and ideas from the Wayland / Hyprland community; credit to upstream projects where appropriate.
- If i used your IP you can request for it to be removed/replaced from the repo or you can ask me to mention that i used your work .

## AI disclaimer
This README was generated with the assistance of an AI. Review the content and adapt it to match the repository and your expectations.
